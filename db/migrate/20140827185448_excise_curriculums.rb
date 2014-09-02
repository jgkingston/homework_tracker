class ExciseCurriculums < ActiveRecord::Migration
  def change
    rename_column :assignments, :curriculum_id, :cohort_id
  end
end
