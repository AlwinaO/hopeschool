class AddTeacherGradeToTeacherSemesters < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_semesters, :teacher_grade, :integer
  end
end
