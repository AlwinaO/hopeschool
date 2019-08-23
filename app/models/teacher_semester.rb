class TeacherSemester < ApplicationRecord
  belongs_to :teacher
  belongs_to :semester

  def self.grade_format
    select(:teacher_grade).first.teacher_grade
  end
end
