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

  let(:matthew) {
    Teacher.create(
      :name => "Matthew",
      :password => "password",
      :email => "matthew@matthew.com",
      :subject => "grammar"
    )
  }

  let(:wakanya) {
    Student.create(
      :name => "Wakanya",
      :grade => "5"
    )
  }

  let(:hlele) {
    Student.create(
      :name => "H'lele",
      :grade => "3"
    )
  }

  let(:winter) {
    Semester.create(
      :quarter => "winter",
      :year => "2019"
    )
  }

  let(:fall) {
    Semester.create(
      :quarter => "fall",
      :year => "2018"
    )
  }

  let(:joburg) {
    Classroom.create(
      :name => "Jo'burg",
      :location => "Main Building",
      :teacher_id => 1

    )
  }

  let(:durban) {
    Classroom.create(
      :name => "Durban",
      :location => "South Building",
      :teacher_id => 1

    )
  }


  it "is valid with a name, email, password, and subject" do
    expect(teacher).to be_valid
  end

  it "is not valid without a password" do
    expect(Teacher.new(name: "Name")).not_to be_valid
  end

  


end
