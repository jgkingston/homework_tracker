class Submission < ActiveRecord::Base

  include Workflow

  belongs_to :assignment
  belongs_to :user
  belongs_to :grader, class_name: "User", foreign_key: :changed_by_user_id

  has_many :links

  accepts_nested_attributes_for :links, allow_destroy: true

  has_many :comments, as: :commentable

  workflow do 

    state :new do
      event :review, transitions_to: :reviewing
    end

    state :reviewing do
      event :return, transitions_to: :incomplete
      event :accept, transitions_to: :complete
    end

    state :complete do

    end

    state :incomplete do
      event :accept, transitions_to: :complete
      event :review, transitions_to: :reviewing
    end
    
  end


end
