require 'rails_helper'

RSpec.describe Classroom, :type => :model do
  let(:classroom) {FactoryBot.create(:classroom)}

  it "has a valid factory" do
    create(:classroom).should be_valid

  end

  # ensure this join table is setup with user-submittable attributes
  context "columns" do
    it { should have_db_column(:name).of_type(:string)}
    it { should have_db_column(:location).of_type(:string)}
  end

  # ensure column name is present before saving
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:location) }
  end


  # ensure classroom record belongs to a teacher, student and semseter
  context "associations" do
    it { should belong_to(:teacher) }
    it { should have_many(:students) }
    it { should have_many(:classroom_semesters) }
    it { should have_many(:semesters).through(:classroom_semesters) }
  end

  # context "#classroom_list" do
  #   it "lists all the classrooms by name and location" do
  #     expect(self.classroom_list).to eq(name and location)
  #
  #   end
  # end

  # context "#teacher_name" do
  #   it "displays the teacher's name" do
  #
  #   end
  # end

end
