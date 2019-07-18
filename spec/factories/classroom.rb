FactoryBot.define do
  factory :classroom do
    name { Faker::Superhero.name}
    location { Faker::Address.building_number}
    association :teacher, factory: :teacher
    association :student, factory: :student
    association :semester, factory: :semester
  end
end
