class CreateAdminRights < ActiveRecord::Migration
  def change
    create_table :admin_rights do |t|
      t.integer :user_id
      t.integer :location_id
      t.timestamps
    end
  end
end
