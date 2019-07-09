FactoryBot.define do
  factory :classroom do
    name { Faker::Superhero.name}
    location { Faker::Address.building_number}
    teacher_id nil
    student_id nil
    semester_id nil
  end
end
