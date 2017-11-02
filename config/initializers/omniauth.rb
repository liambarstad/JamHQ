OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1882259122086128', 'd37351d3de1493a5c0ddad0555798da6'
end
