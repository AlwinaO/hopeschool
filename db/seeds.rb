require "faker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# comment out teachers so it doesn't add 15 new teacher
15.times do
  Teacher.create(
    name:  Faker::Name.first_name,
    email:  Faker::Internet.email,
    password:  Faker::Internet.password,
    subject:  Faker::Educator.subject)
# new_teacher.build_classroom

end

# 8.times do
#   Semester.create(
#     quarter:  Faker::Space.planet,
#     year: Faker::Date.between(1.year.ago, 1.year.from_now)
#   )
# end
#
# 50.times do
#   Student.create(
#     name: Faker::Name.first_name,
#     grade: Faker::Number.within(1..10)
#   )
# end
teacher_ids = Teacher.all.map {|t| t.id}
# [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
# t_id = teacher_ids.pop
# t_id = 15
# [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
15.times do
  new_classroom = Classroom.new(
                  name: Faker::Superhero.name,
                  location: Faker::Address.building_number)
  new_classroom.teacher_id = teacher_ids.pop()
  new_classroom.save
end
