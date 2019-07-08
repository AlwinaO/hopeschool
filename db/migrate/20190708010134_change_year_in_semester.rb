class ChangeYearInSemester < ActiveRecord::Migration[5.2]
  def change
    change_column :semesters, :year, 'date USING CAST("year" AS date)'
  end
end
