class ScheduledCall < ActiveRecord::Base
  belongs_to :coach
  belongs_to :learner

  has_many :suggested_times

  accepts_nested_attributes_for :suggested_times
end
