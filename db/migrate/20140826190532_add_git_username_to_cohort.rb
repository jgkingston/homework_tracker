class AddGitUsernameToCohort < ActiveRecord::Migration
  def change
    add_column :cohorts, :git_username, :string, null: false, default: ""
  end
end
