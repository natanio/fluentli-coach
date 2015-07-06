class User < ActiveRecord::Base
  enum role: [:user, :coach, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create :create_learner

  has_one :coach
  has_one :learner
  has_many :language_relationships

  #accepts_nested_attributes_for :coach

  def set_default_role
    self.role ||= :user
  end

  def create_learner
    Learner.new(user_id: self.id).save
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
