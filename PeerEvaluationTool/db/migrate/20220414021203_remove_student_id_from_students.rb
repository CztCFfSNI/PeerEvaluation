class RemoveStudentIdFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :studentid, :integer
  end
end
