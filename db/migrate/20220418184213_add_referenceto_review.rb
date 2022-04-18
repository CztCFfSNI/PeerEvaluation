class AddReferencetoReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :written_by, :integer, null: false
    add_column :reviews, :written_for, :integer, null: false
  end
end
