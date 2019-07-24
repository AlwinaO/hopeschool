class Student < ApplicationRecord
  belongs_to :classrooms
  belongs_to :teacher
  has_many :semesters

  validates :name, :grade, presence: true
end
