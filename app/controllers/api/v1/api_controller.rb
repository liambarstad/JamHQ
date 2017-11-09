class Api::V1::ApiController < ApplicationController

  helper_method :authenticate_user

  private

  def authenticate_user
    unless @user = TokenService.find_user(request.headers["Token"])
      render status: :forbidden
    end
  end

end
