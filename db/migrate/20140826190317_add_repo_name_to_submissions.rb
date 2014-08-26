class AddRepoNameToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :repo, :string, null: false, default: ""
    add_column :submissions, :limit, :integer, null: false, default: 10
  end
end
