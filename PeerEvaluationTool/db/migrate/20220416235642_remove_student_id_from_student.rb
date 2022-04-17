class RemoveStudentIdFromStudent < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :student_id
  end
end
