class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions

  has_many :comments
  
  has_many :contracts
  has_many :cohorts, through: :contracts

  has_many :admin_rights
  has_many :locations, through: :admin_rights

  enum role: [:student, :ta, :instructor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  validates :last_name, presence: true
  validates :first_name, presence: true

  def set_default_role
    self.role ||= :student
  end

  def full_name
    "#{self.last_name}, #{self.first_name}"
  end

  def submissions_with_status workflow_state
    self.submissions.where(:workflow_state => workflow_state)
  end

  def list_roles
    [ ["student", 0], ["ta", 1], ["instructor", 2], ["admin", 3] ]
  end

end
