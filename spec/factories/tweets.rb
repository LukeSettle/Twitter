FactoryGirl.define do
  factory :tweet do
    body { Faker::Lorem.characters(100) }
    user
  end
end
