class DropStudentTeams < ActiveRecord::Migration[6.1]
  def change
    drop_table :student_teams
  end
end
