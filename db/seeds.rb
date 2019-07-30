require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Teacher.destroy_all
Classroom.destroy_all
Student.destroy_all
Semester.destroy_all

15.times do
  Teacher.create!(
    name:  Faker::Name.unique.first_name,
    email:  Faker::Internet.email,
    password:  Faker::Internet.password,
    subject:  Faker::Educator.subject
  )
end
p "Created #{Teacher.count} teachers."

15.times do
  Classroom.create!(
    name: Faker::Superhero.unique.name,
    location: Faker::Address.building_number,
    teacher_id: Faker::Number.within(1..15)
  )
end
p "Created #{Classroom.count} classrooms."

100.times do
  Student.create!({
    name: Faker::Name.first_name,
    grade: Faker::Number.within(1..10),
    score: Faker::Number.normal(75, 25),
    teacher_id: Faker::Number.within(1..15),
    classroom_id: Faker::Number.within(1..15)
  })
end
p "Created #{Student.count} students."

8.times do
  Semester.create!(
    quarter:  Faker::Space.planet,
    year: Faker::Date.between(1.year.ago, 1.year.from_now)
  )
end
p "Created #{Semester.count} semesters."

10.times do
  TeacherSemester.create!(
    teacher_id: Faker::Number.unique.within(1..15),
    semester_id: Faker::Number.within(1..8)
  )
end

10.times do
  ClassroomSemester.create!(
    classroom_id: Faker::Number.within(1..15),
    semester_id: Faker::Number.within(1..8)
  )
end

20.times do
  StudentSemester.create!(
    student_id: Faker::Number.unique.within(1..20),
    semester_id: Faker::Number.within(1..8)
  )
end
