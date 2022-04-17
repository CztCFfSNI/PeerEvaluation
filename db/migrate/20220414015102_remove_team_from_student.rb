class RemoveTeamFromStudent < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :team, :string
  end
end
