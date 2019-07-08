require 'rails_helper'

RSpec.describe Semester, :type => :model do

  context "associations" do
    it { should have_many(:classrooms) }
  end

  context "validations" do
    it { should validate_presence_of(:quarter) }
    it { should validate_presence_of(:year) }
  end

end
