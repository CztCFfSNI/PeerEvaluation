class AddColumnsToReviews < ActiveRecord::Migration[6.1]
  def change
    change_table(:reviews) do |t|
      t.references :written_by, foreign_key: {to_table: 'students'}
      t.references :written_for, foreign_key: {to_table: 'students'}
    end
  end
end
