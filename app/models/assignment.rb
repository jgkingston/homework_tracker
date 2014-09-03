class Assignment < ActiveRecord::Base

  belongs_to :cohort

  has_many :submissions

  has_many :comments, as: :commentable

  validates :summary, presence: true
  validates :instructions, presence: true
  validates :due_date, presence: true

  def student_submission student_id
    self.submissions.find_by_user_id(student_id)
  end

  def submissions_with_status workflow_state
    self.submissions.where(:workflow_state => workflow_state)
  end

end
