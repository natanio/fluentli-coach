class Coach < ActiveRecord::Base
  belongs_to :user

  has_many :testimonials
  has_many :ratings
  has_many :chats

  after_create :delete_learner # To delete the learner account the coach doesn't need

  def delete_learner
    @user = User.find(self.user_id)

    @user.learner.destroy
  end

  def average_rating
    ratings.sum(:rating) / ratings.size
  end

  def ratings_count
    @total = ratings.sum(:rating)
    if @total >= 1000
      @total = @total / 100
    end
    @total
  end
end