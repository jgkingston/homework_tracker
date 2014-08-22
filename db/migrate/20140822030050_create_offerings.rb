class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.integer :location_id
      t.integer :course_id
      t.timestamps
    end
  end
end
