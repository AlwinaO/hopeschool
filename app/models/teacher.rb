class Teacher < ApplicationRecord
  has_secure_password

  has_one :classroom
  has_many :students
  has_many :teacher_semesters
  has_many :semesters, through: :teacher_semesters

  validates :name, :email, :subject, presence: true
  validates :email, uniqueness: true

end
