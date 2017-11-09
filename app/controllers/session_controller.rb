class SessionController < ApplicationController

  def show; end

  def update
    user = User.find_by(username: params[:username])
    if user && login(user.email, params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    elsif user
      flash[:notice] = "Incorrect Password"
      redirect_to session_path
    else
      flash[:notice] = "User Not Found"
      redirect_to session_path
    end
  end

  def new; end

  def create
    user = User.new(user_params)
    user.generate_errors
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = user.errors.full_messages.join(", ")
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:username, :password, :first_name, :last_name, :email)
  end

end
