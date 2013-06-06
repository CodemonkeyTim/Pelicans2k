class AddDisplayNameToReservation < ActiveRecord::Migration
  def up
    add_column :reservations, :display_activity, :string
  end
  
  def down
    remove_column :reservations, :display_activity, :string
  end
end
