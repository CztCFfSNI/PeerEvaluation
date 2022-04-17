class AddTeamIdToTeams < ActiveRecord::Migration[6.1]
  def change
    add_column :teams, :team_id, :integer
  end
end
