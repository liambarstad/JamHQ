class TokenService

  def self.get_token(attrs)
    JWT.encode(attrs, Rails.application.secrets.secret_key_base)
  end

  def self.decode_token(token)
    begin
      JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    rescue
      return nil
    end
  end

end
