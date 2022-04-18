class RemoveProjectNoFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :projectno
  end
end
