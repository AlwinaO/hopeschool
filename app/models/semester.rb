class Semester < ApplicationRecord
  has_many :classrooms
  has_many :teachers
  has_many :students
# add has_many through for join tables
  validates :quarter, :year, presence: true
end
