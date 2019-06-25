class Teacher < ApplicationRecord
  has_secure_password

  has_many :classrooms
  has_many :students, through: :classrooms

  validates :name, :email, :subject, presence: true
  validates :email, uniqueness: true

end
