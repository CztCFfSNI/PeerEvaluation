class RenameProjectGroupstoProjectTeams < ActiveRecord::Migration[6.1]
  def change
    rename_table :project_groups, :project_teams
  end
end
