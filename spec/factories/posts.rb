FactoryGirl.define do
  factory :post do
    association :user, factory: :'user'
    name { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
  end
end
