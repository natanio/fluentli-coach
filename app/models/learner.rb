class Learner < ActiveRecord::Base
  belongs_to :user

  has_many :testimonials
end