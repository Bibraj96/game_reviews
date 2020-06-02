class User < ActiveRecord::Base
  
  has_many :reviews
  has_secure_password #allows us to use authenticate method which checks an inputted password and compares it with bcrypt's encrypted password
  
end