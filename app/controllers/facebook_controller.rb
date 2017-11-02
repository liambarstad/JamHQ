class FacebookController < ApplicationController

  def update
    login_at(params[:provider])
  end

  def create
    binding.pry
    if @user = login_from("facebook")
      flash[:notice] = "Login Successful"
      redirect_to root_path
    else
      begin
        @user = create_from("facebook")
        reset_session
        auto_login(@user)
        flash[:notice] = "Login Successful"
        redirect_to root_path
      rescue
        flash[:alert] = "Failed to Login Through Facebook"
        redirect_to root_path
      end
    end
  end

end
