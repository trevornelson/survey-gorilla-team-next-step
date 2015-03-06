class User < ActiveRecord::Base
  has_many :surveys
  has_many :user_surveys

  has_secure_password
end
