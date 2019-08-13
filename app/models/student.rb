class Student < ApplicationRecord
  belongs_to :classroom
  belongs_to :teacher
  has_many :student_semesters, dependent: :destroy
  has_many :semesters, through: :student_semesters

  validates :name, :grade, presence: true

  # accepts_nested_attributes_for :classroom, reject_if: :all_blank

  def classroom_name
    self.classroom ? self.classroom.name : nil
  end

  def teacher_name
    self.teacher ? self.teacher.name : nil

  end
end
