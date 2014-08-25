class Course < ActiveRecord::Base

  has_many :cohorts

  has_many :offerings
  has_many :locations, through: :offerings

  has_many :curriculums
  has_many :cohorts, through: :curriculums

end
