class AddColumnsToStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :grade, :string
    add_column :students, :grade, :integer
    add_column :students, :score, :integer
    add_column :students, :teacher_id, :integer
    add_column :students, :classroom_id, :integer
  end
end
