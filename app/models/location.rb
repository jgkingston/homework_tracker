class Location < ActiveRecord::Base

  has_many :cohorts

  has_many :offerings
  has_many :courses, through: :offerings

  has_many :admin_rights
  has_many :users, through: :admin_rights

  validates :city, presence: true

end
