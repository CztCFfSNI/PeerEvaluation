class RemoveTeamIdFromTeam < ActiveRecord::Migration[6.1]
  def change
    remove_column :teams, :team_id
  end
end
