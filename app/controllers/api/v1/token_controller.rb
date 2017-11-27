class Api::V1::TokenController < Api::V1::ApiController

  def create
    email = request.headers['email']
    password = request.headers['password']
    if User.authenticate(email, password)
      render json: { "token": TokenService.get_token(email: email, password: password) }
    else
      render json: nil
    end
  end

end
