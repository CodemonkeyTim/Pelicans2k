class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :starts_at
      t.date :date
      t.integer :team_id
      t.string :activity
      t.string :created_by

      t.timestamps
    end
  end
end
