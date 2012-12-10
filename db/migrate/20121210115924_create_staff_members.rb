class CreateStaffMembers < ActiveRecord::Migration
  def change
    create_table :staff_members do |t|
      t.string :f_name
      t.string :l_name
      t.string :role
      t.string :email
      t.string :phone
      t.integer :team_id
      
      t.timestamps
    end
  end
end
