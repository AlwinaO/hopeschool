class Classroom < ApplicationRecord
  belongs_to :teacher
  belongs_to :student
  belongs_to :semester

  validates :name, :location, presence: true
  validates :name, :location, uniqueness: true

  # list the teacher, number of students and the current semester

  
end
