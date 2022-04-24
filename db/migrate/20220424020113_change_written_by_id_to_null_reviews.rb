class ChangeWrittenByIdToNullReviews < ActiveRecord::Migration[6.1]
  def change
    change_column_null :reviews, :written_by_id, true
    change_column_null :reviews, :written_for_id, true
  end
end
