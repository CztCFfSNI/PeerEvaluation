class AddForeignKeyToStudent < ActiveRecord::Migration[6.1]
  def change
    add_reference :students, :team, index:true, foreign_key:true
  end
end
