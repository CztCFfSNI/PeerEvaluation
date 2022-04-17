class RemoveTeamFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :teams_id
  end
end

