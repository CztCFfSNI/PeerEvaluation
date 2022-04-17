class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :projectno
      t.integer :studentid
      t.integer :personalscore
      t.integer :workscore
      t.string :comment

      t.timestamps
    end
  end
end
