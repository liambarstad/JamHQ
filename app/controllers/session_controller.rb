class SessionController < ApplicationController

  def show
    @user = User.new
  end

  def update
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    elsif user
      flash[:notice] = "Incorrect Password"
      redirect_to session_show_path
    else
      flash[:notice] = "User Not Found"
      redirect_to session_show_path
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(username: params[:username],
                    password: params[:password],
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    role: 0)
    user.validate
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = user.errors.full_messages.join(", ")
      redirect_to new_session_path
    end
  end

end
