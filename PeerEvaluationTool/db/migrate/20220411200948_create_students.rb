class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :Fname
      t.string :Lname
      t.string :email
      t.integer :studentid

      t.timestamps
    end
  end
end
