require 'rails_helper'

RSpec.describe Semester, :type => :model do

  context "associations" do
    it { should have_many(:teacher_semesters) }
    it { should have_many(:teachers).through(:teacher_semesters) }
    it { should have_many(:classroom_semesters) }
    it { should have_many(:classrooms).through(:classroom_semesters) }
    it { should have_many(:student_semesters) }
    it { should have_many(:students).through(:student_semesters) }

  end

  context "validations" do
    it { should validate_presence_of(:quarter) }
    it { should validate_presence_of(:year) }
  end

end
