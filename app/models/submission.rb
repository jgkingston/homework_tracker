class Submission < ActiveRecord::Base

  belongs_to :assignment
  belongs_to :user

  has_many :links

  accepts_nested_attributes_for :links, allow_destroy: true

end
