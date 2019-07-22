class ChangeClassrooms < ActiveRecord::Migration[5.2]
  def change
    remove_column :classrooms, :student_id, :bigint
    remove_column :classrooms, :semester_id, :bigint
  end
end
