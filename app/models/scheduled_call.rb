class ScheduledCall < ActiveRecord::Base
  belongs_to :coach
  belongs_to :learner
end
