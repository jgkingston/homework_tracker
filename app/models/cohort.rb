class Cohort < ActiveRecord::Base

  belongs_to :location

  belongs_to :course

  has_many :contracts
  has_many :users, through: :contracts

  has_one :curriculum
  has_many :assignments, through: :curriculum

end
