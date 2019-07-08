class Student < ApplicationRecord
  has_many :classrooms
  has_many :teachers, through: :classrooms

  validates :name, :grade, presence: true 
end
