class UsersController < ApplicationController

 def index
   @posts = Post.all
 end

 def show
   @posts = current_user.posts.order("created_at DESC")
 end

end
