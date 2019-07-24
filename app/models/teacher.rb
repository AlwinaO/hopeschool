class Teacher < ApplicationRecord
  has_secure_password

  has_one :classrooms
  has_many :students
  has_many :semesters

  validates :name, :email, :subject, presence: true
  validates :email, uniqueness: true

end
