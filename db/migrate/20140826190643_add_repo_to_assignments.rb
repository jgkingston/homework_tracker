class AddRepoToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :repo, :string, null: false, default: ""
  end
end
