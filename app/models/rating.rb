class Rating < ActiveRecord::Base
  belongs_to :learner
  belongs_to :coach
end
