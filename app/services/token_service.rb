class TokenService

  def self.get_token(email, password)
    payload = { email: email, password: password }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.find_user(token)
    begin
      result = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      User.authenticate(result["email"], result["password"])
    rescue JWT::DecodeError
      return false
    end
  end

end
