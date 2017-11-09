class UsersController < ApplicationController

 def index

 end

 def show
   begin
     @user = User.find(params[:id])
     @posts = @user.posts.order("created_at DESC")
   rescue
     render template: "utility#404"
   end
 end

end
