# The first thing you need to configure is which modules you need in your app.
# The default is nothing which will include only core features (password encryption, login/logout).
# Available submodules are: :user_activation, :http_basic_auth, :remember_me,
# :reset_password, :session_timeout, :brute_force_protection, :activity_logging, :external
Rails.application.config.sorcery.submodules = [:external]

Rails.application.config.sorcery.configure do |config|

  config.external_providers = [:facebook]

  config.user_config do |user|
    user.authentications_class = Authentication
  end

  config.facebook.key = Rails.application.secrets.facebook_public_key
  config.facebook.secret = Rails.application.secrets.facebook_secret_key
  config.facebook.callback_url = "http://localhost:3000/auth/facebook/callback"
  config.facebook.user_info_mapping = { first_name: "first_name",
                                        last_name: "last_name",
                                        username: "name",
                                        facebook_id: "id" }
                                        # image, password, location, email
  config.facebook.scope = "email,public_profile,user_location"
  # user_actions.music
  config.facebook.display = "popup"

  config.user_class = 'User'
end
