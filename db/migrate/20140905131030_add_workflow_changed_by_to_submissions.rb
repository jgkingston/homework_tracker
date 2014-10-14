class AddWorkflowChangedByToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :changed_by_user_id, :integer
  end
end
