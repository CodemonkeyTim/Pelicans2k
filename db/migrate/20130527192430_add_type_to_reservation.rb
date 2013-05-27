class AddTypeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :display_text, :string
  end
end
