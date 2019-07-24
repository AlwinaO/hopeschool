class Classroom < ApplicationRecord
  belongs_to :teacher
  has_many :students
  has_many :semesters

  validates :name, :location, presence: true
  validates :name, :location, uniqueness: true

  # list the teacher, number of students and the current semester


end
