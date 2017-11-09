class Api::V1::TokenController < Api::V1::ApiController

  def create
    username = request.headers['username']
    password = request.headers['password']
    if User.authenticate(username, password)
      token = TokenService.new(username: username, password: password)
      render json: token.get_token
    else
      render json: nil
    end
  end

end
