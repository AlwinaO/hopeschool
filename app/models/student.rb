class Student < ApplicationRecord
  has_many :classrooms
  has_many :teachers, through: :classrooms
end
