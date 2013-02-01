class CreateBaseReservations < ActiveRecord::Migration
  def change
    create_table :base_reservations do |t|
      t.string :starts_at
      t.string :day
      t.integer :team_id
      t.string :activity
      t.string :created_by

      t.timestamps
    end
  end
end
