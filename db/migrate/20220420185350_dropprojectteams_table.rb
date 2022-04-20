class DropprojectteamsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :project_teams_tables
  end
end
