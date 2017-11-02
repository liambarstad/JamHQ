class User < ApplicationRecord
  validates_presence_of :username, :crypted_password, :first_name, :email, :role
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  def generate_errors
    errors.add(:username, :blank, message: "Must input username") if username.nil?
    errors.add(:first_name, :blank, message: "Must input first name") if first_name.nil?
    errors.add(:email, :blank, message: "Must input email") if email.nil?
    errors.add(:crypted_password, :blank, message: "Must input password") if crypted_password.nil?
  end

end
