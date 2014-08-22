class User < ActiveRecord::Base
  ROLES = %w[admin instructor ta student]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :assingments
  has_many :homeworks
  has_many :cohorts

end
