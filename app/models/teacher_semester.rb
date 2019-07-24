class TeacherSemester < ApplicationRecord
  belongs_to :teacher
  belongs_to :semester
end
