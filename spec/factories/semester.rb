FactoryBot.define do
  factory :semester do
    quarter { Faker::Space.planet}
    year {rand(1.year).from_now || rand(1.year).ago}

  end
end
