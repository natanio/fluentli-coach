class Coach < ActiveRecord::Base
  belongs_to :user

  has_many :testimonials
  has_many :ratings

  after_create :delete_learner # To delete the learner account the coach doesn't need

  def delete_learner
    @user = User.find(self.user_id)

    @user.learner.destroy
  end
end