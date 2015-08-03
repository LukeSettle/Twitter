FactoryGirl.define do
  factory :tweet do
    body { Faker::Lorem.paragraph }
  end
end