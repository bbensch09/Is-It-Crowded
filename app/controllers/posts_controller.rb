# https://github.com/bbensch09/phase-2-assessment

# SHOW A SPECIFIC POST
get '/posts/:id' do
	@post = Post.find(params[:id])
	@kudos = Kudo.where("post_id=?", params[:id])
	if current_user
		@current_user_reviews = Kudo.where("Message to user that they have already created a post")
	end

	erb :show_post
end


post '/posts/new' do
	if session[:user_id] == nil
		@error = "You must first be logged to create a new post."
		erb :login
	else    
		@user = current_user
		@post = Post.find(params[:id])
		@location = Location.where("id=?", @post.location.id).first
		# binding.pry
		puts "The post.location.id is #{@post.location.id}"
		puts "The wait_time params are #{params[:wait_time]}"
		p "Params are #{params}"
		@new_post = Post.create!(wait_time: params[:wait_time], crowded: params[:crowded], status: 'Active', post_creator_id: @user.id, location_id: @location.id)
		puts "new post successfuly created!"
		redirect to "/posts/#{@new_post.id}"
	end
end



# CREATE A NEW POST
# post '/posts/new' do
#   if session[:user_id] == nil
#     @error = "You must first be logged to create a new restaurant."
#     erb :login
#   else    
#     @user = current_user
#     puts "current user is #{@user}"
#     @new_restaurant = Restaurant.create!(name: params[:name], cuisine: params[:cuisine], restaurant_creator_id: @user.id, address: params[:address], city: params[:city], state: params[:state], zip: params[:zip])
#     # AJAX -- neeeds to be udpated for Yelp restaurant attributes
#     # return {title: @new_restaurant.title, user_id: @user.id, votes: @new_restaurant.points, post_id: @new_restaurant.id}.to_json
#     #below was original Ruby route, replacing with AJAX above
#     @restaurants = Restaurant.all
#     erb :index
#   end
# end