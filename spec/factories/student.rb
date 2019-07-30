FactoryBot.define do
  factory :student do
    name { Faker::Name.first_name}
    grade { Faker::Number.within(1..10)}
    association :teacher, factory: :teacher
    association :classroom, factory: :classroom
  end
end
