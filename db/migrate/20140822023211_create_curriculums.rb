class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.integer :cohort_id
      t.integer :course_id
      t.timestamps
    end
  end
end
