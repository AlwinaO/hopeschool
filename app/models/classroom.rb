class Classroom < ApplicationRecord
  belongs_to :teacher
  has_many :students
  has_many :classroom_semesters
  has_many :semesters, through: :classroom_semesters

  validates :name, :location, presence: true
  validates :name, :location, uniqueness: true
  validates :teacher_id, uniqueness: true


  # list the teacher, number of students and the current semester


end
