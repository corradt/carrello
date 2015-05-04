class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.string :fullname
      t.string :photo
      t.string :role

      t.timestamps null: false
    end
  end
end
