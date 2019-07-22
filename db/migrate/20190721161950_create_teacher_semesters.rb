class CreateTeacherSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_semesters do |t|
      t.belongs_to :teacher, foreign_key: true
      t.belongs_to :semester, foreign_key: true

      t.timestamps
    end
  end
end
