class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password, :first_name

  enum role: [:default, :platform_admin]

  def validate
    errors.add(:username, :blank, message: "username cannot be blank") if username.nil?
    errors.add(:password, :blank, message: "password cannot be blank") if password.nil?
    errors.add(:first_name, :blank, message: "first name cannot be blank") if first_name.nil?
  end

end
