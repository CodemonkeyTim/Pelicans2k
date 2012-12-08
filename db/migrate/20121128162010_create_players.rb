class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :f_name
      t.string :l_name
      t.integer :team_id
      t.integer :number
      t.string :position

      t.timestamps
    end
  end
end
