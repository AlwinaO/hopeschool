require 'rails_helper'

RSpec.describe Teacher, :type => :model do

  let(:teacher) {
    Teacher.create(
      :name => "Ellen",
      :password => "password",
      :email => "ellen@ellen.com",
      :subject => "math"
    )
  }

  let(:teacher) {
    Teacher.create(
      :name => "Matthew",
      :password => "password",
      :email => "matthew@matthew.com",
      :subject => "grammar"
    )
  }

  let(:classroom) {
    Classroom.create(
      :name => "Jo'burg",
      :location => "Main Building",
      :teacher_id => 1

    )
  }

  let(:classroom) {
    Classroom.create(
      :name => "Durban",
      :location => "South Building",
      :teacher_id => 1

    )
  }

  it "is valid with a name, email, password, and subject" do
    expect(teacher).to be_valid
  end
end
