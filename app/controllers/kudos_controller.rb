# https://github.com/bbensch09/phase-2-assessment
# 						  GET    /quotes(.:format)                  quotes#index
#                         POST   /quotes(.:format)                  quotes#create
#               new_quote GET    /quotes/new(.:format)              quotes#new
#              edit_quote GET    /quotes/:id/edit(.:format)         quotes#edit
#                   quote GET    /quotes/:id(.:format)              quotes#show
#                         PATCH  /quotes/:id(.:format)              quotes#update
#                         PUT    /quotes/:id(.:format)              quotes#update
#                         DELETE /quotes/:id(.:format)              quotes#destroy

post '/kudos/new' do
  if session[:user_id] == nil
    @error = "You must first be logged to create a kudo."
    erb :login
  else    
    @user = current_user
    puts "current user is #{@user}"
    @post = Post.find(params[:id])
    @new_kudo = Kudo.create!(kudo_creator_id: @user.id, value: 1, post_id: @post.id)
    erb :show_post
  end
end
