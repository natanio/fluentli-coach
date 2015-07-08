class Chat < ActiveRecord::Base
  belongs_to :learner
  belongs_to :coach
  has_many :chat_messages
end
