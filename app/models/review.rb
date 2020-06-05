class Review < ActiveRecord::Base

  belongs_to :user
  
  validates :game, presence: true
  validates :content, presence: true
end