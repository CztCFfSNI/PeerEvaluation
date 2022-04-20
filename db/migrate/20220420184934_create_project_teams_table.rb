class CreateProjectTeamsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :project_teams_tables do |t|
      t.references :project, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.timestamps
    end
  end
end
