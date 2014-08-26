class Assignment < ActiveRecord::Base

  belongs_to :curriculum

  has_many :submissions

  has_many :comments, as: :commentable

end
