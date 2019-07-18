FactoryBot.define do
  factory :semester do
    quarter { Faker::Space.planet}
    year {Faker::Date.between(1.year.ago, 1.year.from_now)}

  end
end
