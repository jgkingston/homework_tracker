class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :summary
      t.text :instructions
      t.integer :user_id
      t.timestamps
    end
  end
end
