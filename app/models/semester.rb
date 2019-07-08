class Semester < ApplicationRecord
  has_many :classrooms

  validates :quarter, :year, presence: true
end
