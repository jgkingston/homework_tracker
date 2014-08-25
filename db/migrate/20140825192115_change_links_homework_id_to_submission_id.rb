class ChangeLinksHomeworkIdToSubmissionId < ActiveRecord::Migration
  def change
    rename_column :links, :homework_id, :submission_id
  end
end
