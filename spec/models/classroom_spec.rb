require 'rails_helper'

RSpec.describe Classroom, :type => :model do

  it "has a valid factory" do
    Factory.create(:classroom).should be_valid
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
    it { should belong_to(:student) }
    it { should belong_to(:semester) }
  end

  context "#classroom_list" do
    it "lists all the classrooms by name and location" do


    end
  end

  # context "#teacher_name" do
  #   it "displays the teacher's name" do
  #
  #   end
  # end

end
