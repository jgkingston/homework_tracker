class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :path
      t.integer :homework_id
      t.timestamps
    end
  end
end
