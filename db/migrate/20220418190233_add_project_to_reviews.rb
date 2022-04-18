class AddProjectToReviews < ActiveRecord::Migration[6.1]
  def change
    change_table(:reviews) do |t|
      t.references :project, foreign_key: {to_table: 'projects'}
    end
  end
end
