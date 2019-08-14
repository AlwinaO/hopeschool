class Teacher < ApplicationRecord
  has_secure_password

  has_one :classroom
  has_many :students
  has_many :teacher_semesters
  has_many :semesters, through: :teacher_semesters

  validates :name, :email, :subject, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :classroom, reject_if: :all_blank

  def classroom_name
    self.classroom ? self.classroom.name : nil
  end

  #add scope method to find students with the highest or lowest score


end
