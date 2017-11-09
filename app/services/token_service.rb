class TokenService

  def initialize(attrs = {})
    @username = attrs[:username]
    @password = attrs[:password]
  end

  def get_token
    payload = { username: @username, password: @password }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.find_user(token)
    begin
      result = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      check_user(result["username"], result["password"])
    rescue JWT::DecodeError
      return false
    end
  end

  def

  private

  def self.check_user(username, password)
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      return user
    else
      return false
    end
  end

end
