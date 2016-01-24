# https://github.com/bbensch09/phase-2-assessment

# # 					  GET    /quotes(.:format)                  quotes#index
#                         POST   /quotes(.:format)                  quotes#create
#               new_quote GET    /quotes/new(.:format)              quotes#new
#              edit_quote GET    /quotes/:id/edit(.:format)         quotes#edit
#                   quote GET    /quotes/:id(.:format)              quotes#show
#                         PATCH  /quotes/:id(.:format)              quotes#update
#                         PUT    /quotes/:id(.:format)              quotes#update
#                         DELETE /quotes/:id(.:format)              quotes#destroy


# SHOW A SPECIFIC POST
get '/posts/:id' do
  @post = Post.find(params[:id])
  @kudos = Kudo.where("post_id=?", params[:id])
  if current_user
    @current_user_reviews = Kudo.where("Message to user that they have already created a post")
  end

  erb :show_post
end

# CREATE A NEW POST