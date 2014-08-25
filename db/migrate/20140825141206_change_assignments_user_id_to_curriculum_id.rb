class ChangeAssignmentsUserIdToCurriculumId < ActiveRecord::Migration
  def change
    rename_column :assignments, :user_id, :curriculum_id
  end
end
