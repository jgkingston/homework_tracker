class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.date :start_date
      t.integer :location_id
      t.integer :course_id
      t.timestamps
    end
  end
end
