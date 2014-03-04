class AddTeamPicUrlToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :picture_url, :string
  end
end
