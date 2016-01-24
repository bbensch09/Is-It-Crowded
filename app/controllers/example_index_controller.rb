get '/' do
  @restaurants = Restaurant.all
  erb :index
end



get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(email: params[:email])
  @user.password = params[:password_plaintext]
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = @user.errors.full_messages
    @errors << "Sorry, but that email has already been taken."
    erb :register
  end
end

get '/session_view' do
  erb :session_view
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password_plaintext])
    session[:user_id] = @user.id
    redirect "/"
  else
    session.delete(:user_id)
    @error = "Please check your email address and password and try again."
    erb :login
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

post '/new' do
  if session[:user_id] == nil
    @error = "You must first be logged to create a new restaurant."
    erb :login
  else    
    @user = current_user
    puts "current user is #{@user}"
    @new_restaurant = Restaurant.create!(name: params[:name], cuisine: params[:cuisine], restaurant_creator_id: @user.id, address: params[:address], city: params[:city], state: params[:state], zip: params[:zip])
    # AJAX -- neeeds to be udpated for Yelp restaurant attributes
    # return {title: @new_restaurant.title, user_id: @user.id, votes: @new_restaurant.points, post_id: @new_restaurant.id}.to_json
    #below was original Ruby route, replacing with AJAX above
    @restaurants = Restaurant.all
    erb :index
  end
end

get '/:id/edit' do
    @restaurant = Restaurant.find(params[:id])
    erb :update_restaurant
end

put '/:id/update' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update_attributes(name: params[:name], cuisine: params[:cuisine], address: params[:address], city: params[:city], state: params[:state], zip: params[:zip])
    if @restaurant.save
      redirect "/"
    else
    erb :update_restaurant
    end
end

delete '/:id/delete' do
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    puts "[LOG] restaurant named #{@restaurant.name} has been removed."
    redirect "/"
end



# MAKE A NEW review TO A GIVEN RESTAURANT
post '/:id/reviews' do
  puts "Hello world"
    @user = current_user
    @restaurant = Restaurant.find(params[:id])
    puts "current user is #{@user} and restaurant id is #{@restaurant.id}"
    @review = Review.create!(body: params[:body], reviewer_id: @user.id, rating: params[:rating], restaurant_id: @restaurant.id)
  @restaurants = Restaurant.all
    redirect "/#{@restaurant.id}"
end

# SHOW A SPECIFIC RESTAURANT
get '/:id' do
  @restaurant = Restaurant.find(params[:id])
  @reviews = Review.where("restaurant_id=?",params[:id])
  if current_user
    @current_user_reviews = Review.where("restaurant_id=? AND reviewer_id=?",params[:id], current_user.id)
  end

  erb :show_restaurant
end

