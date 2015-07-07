class User < ActiveRecord::Base
  enum role: [:user, :coach, :admin]
  after_initialize :set_default_role, :if => :new_record?
  after_create :create_learner

  has_one :coach
  has_one :learner
  has_many :language_relationships

  has_attached_file :avatar, :s3_host_name => "s3.amazonaws.com", :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "http://s3.amazonaws.com/dev.media.courbanize.com/user_photos/user_photo_default_1.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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
