class ChangeActivityToActivityTypeInBaseresevationsToo < ActiveRecord::Migration
  def up
    add_column :base_reservations, :activity_type, :string
    remove_column :base_reservations, :activity
  end

  def down
    add_column :base_reservations, :activity, :string
    remove_column :base_reservations, :activity_type
  end
end
