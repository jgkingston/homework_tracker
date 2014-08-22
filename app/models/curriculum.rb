class Curriculum < ActiveRecord::Base

  belongs_to :course
  belongs_to :cohort
  
  has_many :assignments

end
