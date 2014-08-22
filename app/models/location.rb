class Location < ActiveRecord::Base

  has_many :cohorts

  has_many :offerings
  has_many :courses, through: :offerings


end
