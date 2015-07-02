class User < ActiveRecord::Base
  enum role: [:user, :coach, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create :create_learner

  has_many :coaches
  has_many :learners
  has_many :language_relationships

  #accepts_nested_attributes_for :language_relationships

  def set_default_role
    self.role ||= :user
  end

  def create_learner
    self.learners.create
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
