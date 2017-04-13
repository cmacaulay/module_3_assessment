FactoryGirl.define do
  factory :item do
    name Faker::StarWars.vehicle
    description "description"
    image_url Faker::Internet.url
  end
end
