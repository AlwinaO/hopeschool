class AddStudentGradeToStudentSemesters < ActiveRecord::Migration[5.2]
  def change
    add_column :student_semesters, :student_grade, :integer
  end
end
