class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password, :first_name, :last_name

  enum role: [:default, :platform_admin]
end
