class LanguageRelationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  validates :user_id, uniqueness: {scope: :language_id}
end
