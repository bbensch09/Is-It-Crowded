get '/' do
	@locations = Location.all	
  	erb :index
end

get '/app' do
	@locations = Location.all	
  	erb :index
end

get '/api' do
	erb :api_demo
end

# SHOW A SPECIFIC RESTAURANT
# get '/:id' do
#   @restaurant = Restaurant.find(params[:id])
#   @reviews = Review.where("restaurant_id=?",params[:id])
#   if current_user
#     @current_user_reviews = Review.where("restaurant_id=? AND reviewer_id=?",params[:id], current_user.id)
#   end

#   erb :show_restaurant
# end