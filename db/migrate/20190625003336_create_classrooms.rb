class CreateClassrooms < ActiveRecord::Migration[5.2]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :location
      t.belongs_to :teacher, index: true
      t.belongs_to :student, index: true
      t.belongs_to :semester, index: true

      t.timestamps
    end
  end
end
