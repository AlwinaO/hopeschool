require 'rails_helper'

RSpec.describe Student, :type => :model do

  context "associations" do
    it { should belong_to(:classroom) }
    it { should have_many(:student_semesters) }
    it { should have_many(:semesters).through(:student_semesters) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:grade) }
  end

end
