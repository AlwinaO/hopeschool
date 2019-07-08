require 'rails_helper'

RSpec.describe Student, :type => :model do

  context "associations" do
    it { should have_many(:classrooms) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:grade) }
  end

end
