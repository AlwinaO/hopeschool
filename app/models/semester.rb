class Semester < ApplicationRecord
  has_many :classroom_semesters
  has_many :classrooms, through: :classroom_semesters
  has_many :teacher_semesters
  has_many :teachers, through: :teacher_semesters
  has_many :student_semesters
  has_many :students, through: :student_semesters
# add has_many through for join tables
  validates :quarter, :year, presence: true

  def formatted_year
    self.year.strftime("%Y") if self.year

  end
end
