class User < ActiveRecord::Base
  
  has_many :reviews

  has_secure_password #allows us to use authenticate method which checks an inputted password and compares it with bcrypt's encrypted password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  # these validation requirements need to be met in order to create, save, or update a new user
end