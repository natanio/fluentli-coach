class Learner < ActiveRecord::Base
  belongs_to :user

  has_many :testimonials
  has_many :ratings
  has_many :chats
end