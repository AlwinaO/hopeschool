class CreateClassroomSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :classroom_semesters do |t|
      t.belongs_to :classroom, foreign_key: true
      t.belongs_to :semester, foreign_key: true

      t.timestamps
    end
  end
end
