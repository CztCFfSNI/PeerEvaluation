class RemoveStudentIdFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :studentid
  end
end
