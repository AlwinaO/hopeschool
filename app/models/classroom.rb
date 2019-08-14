class Classroom < ApplicationRecord
  belongs_to :teacher, optional: true
  has_many :students
  has_many :classroom_semesters
  has_many :semesters, through: :classroom_semesters

  validates :name, :location, presence: true
  validates :name, uniqueness: true



  # list the teacher, number of students and the current semester
  def teacher_name
    self.teacher ? self.teacher.name : nil
  end

  def student_count
    self.students.count
  end

end
