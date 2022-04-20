class Renameprojectteamstable < ActiveRecord::Migration[6.1]
  def change
    rename_table :project_teams_tables, :project_teams
  end
end
