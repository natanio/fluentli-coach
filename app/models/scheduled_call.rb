class ScheduledCall < ActiveRecord::Base
  # after_create :save_suggested_times

  belongs_to :coach
  belongs_to :learner

  has_many :suggested_times

  accepts_nested_attributes_for :suggested_times

  # def save_suggested_times
  #   yo
  #   self.suggested_times.new(time: @suggested_time_1, agreed: false)
  #   self.suggested_times.new(time: @suggested_time_2, agreed: false)
  #   self.suggested_times.new(time: @suggested_time_3, agreed: false)
  # end
end
