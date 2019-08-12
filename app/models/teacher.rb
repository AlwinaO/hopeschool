class Teacher < ApplicationRecord
  has_secure_password

  has_one :classroom
  has_many :students
  has_many :teacher_semesters
  has_many :semesters, through: :teacher_semesters

  validates :name, :email, :subject, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :classroom, reject_if: :all_blank

  # def classroom_attributes=(classroom_attributes)
  #   classroom_attributes.each do |i, classroom_attribute|
  #     if classroom_attributes[:name].present?
  #       classroom = Classroom.find_or_create_by(name:  classroom_attributes[:name])
  #       if !self.classroom.include?(classroom)
  #         self.build_classroom(:classroom => classroom)
  #       end
  #     end
  #   end
  # end

  def classroom_name
    self.classroom ? self.classroom.name : nil
  end

  #add scope method to find students with the highest or lowest score
end
