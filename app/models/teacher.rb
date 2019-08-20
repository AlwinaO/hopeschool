class Teacher < ApplicationRecord
  has_secure_password

  has_one :classroom
  has_many :students
  has_many :highest_score_students, -> { highest_scores }, class_name: "Student"
  has_many :lowest_score_students, -> { lowest_scores }, class_name: "Student"
  has_many :teacher_semesters, inverse_of: :teacher
  has_many :semesters, through: :teacher_semesters

  validates :name, :email, :subject, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :classroom, reject_if: :all_blank
  # accepts_nested_attributes_for :semesters
  # accepts_nested_attributes_for :teacher_semesters, allow_destroy: true, reject_if: lambda {|attributes| attributes['teacher_grade'].blank?}

  def classroom_name
    self.classroom ? self.classroom.name : nil
  end

  # def grade_format
  #   self.teacher_semesters ? self.teacher_semesters.collect { |ts| ts.teacher_grade.to_i} : nil
  # end
end
