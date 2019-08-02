class Student < ApplicationRecord
  belongs_to :classroom, optional: true
  belongs_to :teacher
  has_many :student_semesters
  has_many :semesters, through: :student_semesters

  validates :name, :grade, presence: true
end
