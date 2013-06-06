class ChangeActivityIntoActivityType < ActiveRecord::Migration
  def up
    add_column :reservations, :activity_type, :string
    remove_column :reservations, :activity
  end

  def down
    add_column :reservations, :activity, :string
    remove_column :reservations, :activity_type
  end
end
