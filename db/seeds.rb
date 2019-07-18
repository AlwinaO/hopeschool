require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do
  Classroom.create(
    name: Faker::Superhero.name,
    location: Faker::Address.building_number)
end

15.times do
  teacher = Teacher.create(
    name:  Faker::Name.first_name,
    email:  Faker::Internet.email,
    password:  Faker::Internet.password,
    subject:  Faker::Educator.subject)

  teacher.classrooms.create
end

8.times do
  Semester.create(
    quarter:  Faker::Space.planet,
    year: Faker::Date.between(1.year.ago, 1.year.from_now)
  )
end

50.times do
  Student.create(
    name: Faker::Name.first_name,
    grade: Faker::Number.within(1..10)
  )
end
