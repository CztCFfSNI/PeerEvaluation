class FixColumnNameInReview < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :written_by, :written_by_id
    rename_column :reviews, :written_for, :written_for_id
  end
end
