class Api::V1::ApiController < ApplicationController
  helper_method :authenticate_user,
                :find_body

  private

  def authenticate_user
    unless @user = TokenService.find_user(request.headers["Token"])
      render status: :forbidden
    end
  end

  def find_body
    @body = request.headers['body']
  end

end
