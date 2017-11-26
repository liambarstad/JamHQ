class User < ApplicationRecord
  authenticates_with_sorcery!
  validates_presence_of :username, :crypted_password, :first_name, :email, :role

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :authentications, :dependent => :destroy
  has_many :posts
  has_many :comments

  accepts_nested_attributes_for :authentications

  enum role: [:default, :venue_admin, :platform_admin]
end
