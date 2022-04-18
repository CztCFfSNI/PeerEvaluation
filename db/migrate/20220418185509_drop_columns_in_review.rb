class DropColumnsInReview < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :written_by_id
    remove_column :reviews, :written_for_id
  end
end
