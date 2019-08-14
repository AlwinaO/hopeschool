class Student < ApplicationRecord
  belongs_to :classroom
  belongs_to :teacher
  has_many :student_semesters, dependent: :destroy
  has_many :semesters, through: :student_semesters

  validates :name, :grade, presence: true

  scope :highest_scores, -> {where("score > ?", 75)}
  scope :best_student, -> {order("score DESC").first.name}

  scope :lowest_scores, -> {where("score < ?", 75)}
  # scope :lowest_scores, -> {order("score").limit(5)}
  scope :worst_student, -> {order("score").first.name}

  def classroom_name
    self.classroom ? self.classroom.name : nil
  end

  def teacher_name
    self.teacher ? self.teacher.name : nil
  end
end
