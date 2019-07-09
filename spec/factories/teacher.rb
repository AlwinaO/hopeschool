FactoryBot.define do
  factory :teacher do
    name { Faker::Name.first_name}
    email { Faker::Internet.email}
    password { Faker::Internet.password}
    subject { Faker::Educator.subject}
  end
end
