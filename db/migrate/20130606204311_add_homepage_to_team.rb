class AddHomepageToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :homepage, :string
  end
end
