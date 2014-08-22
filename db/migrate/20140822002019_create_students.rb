class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.date :dob
      t.string :mailing_address
      t.string :email
      t.string :phone
      t.string :twitter
      t.string :github
      t.text :bio
      t.timestamps
    end
  end
end
