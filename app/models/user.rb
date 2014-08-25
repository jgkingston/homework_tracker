class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :submissions
  
  has_many :contracts
  has_many :cohorts, through: :contracts

  enum role: [:student, :ta, :instructor, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :student
  end

end
