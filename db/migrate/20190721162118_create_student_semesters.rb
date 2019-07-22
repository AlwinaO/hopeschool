class CreateStudentSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :student_semesters do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :semester, foreign_key: true

      t.timestamps
    end
  end
end
