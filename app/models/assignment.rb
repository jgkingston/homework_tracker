class Assignment < ActiveRecord::Base

  belongs_to :curriculum

  has_many :submissions


end
