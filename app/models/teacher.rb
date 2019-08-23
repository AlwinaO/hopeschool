class Teacher < ApplicationRecord
  has_secure_password

  has_one :classroom
  has_many :students
  has_many :highest_score_students, -> { highest_scores }, class_name: "Student"
  has_many :lowest_score_students, -> { lowest_scores }, class_name: "Student"
  has_many :teacher_semesters, inverse_of: :teacher
  has_many :semesters, through: :teacher_semesters

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  accepts_nested_attributes_for :classroom, reject_if: :all_blank
  # accepts_nested_attributes_for :semesters
  # accepts_nested_attributes_for :teacher_semesters, allow_destroy: true, reject_if: lambda {|attributes| attributes['teacher_grade'].blank?}

  def self.create_with_google_omniauth(auth)
    find_or_create_by(email: auth[:info][:email]) do |t|
      t.name = auth.info.name
      t.password = SecureRandom.hex
    end
  end

  def self.create_with_facebook_omniauth(auth)
    teacher = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
       teacher.name = auth['info']['name']
       teacher.email = auth['info']['email']
       teacher.password = auth['uid']

       if Teacher.exists?(teacher.id)
         teacher
       else
         teacher.save!
         teacher
       end
  end

  def classroom_name
    self.classroom ? self.classroom.name : nil
  end

  def grade_format
    self.teacher_semesters ? self.teacher_semesters.to_a.map do |ts| puts ts.teacher_grade end : nil
  end
end
