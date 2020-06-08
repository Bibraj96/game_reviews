class User < ActiveRecord::Base
  
  has_many :reviews

  has_secure_password 
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
end