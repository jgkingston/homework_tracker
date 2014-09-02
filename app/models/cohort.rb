class Cohort < ActiveRecord::Base

  belongs_to :location

  belongs_to :course

  has_many :contracts
  has_many :users, through: :contracts

  has_many :assignments

end
