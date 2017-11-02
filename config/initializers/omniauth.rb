OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_public_key, Rails.application.secrets.facebook_secret_key,
           display: "page"
end
