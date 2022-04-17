class AddTeamToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :team, :string
  end
end
