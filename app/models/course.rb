class Course < ActiveRecord::Base

  has_many :cohorts

  has_many :offerings
  has_many :locations, through: :offerings

  has_many :cohorts
end
