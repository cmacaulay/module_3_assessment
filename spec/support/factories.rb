FactoryGirl.define do
  factory :item do
    name Faker::StarWars.vehicle
    description Faker::HowIMetYourMother.catch_phrase
    image_url Faker::Internet.url
  end

  factory :user do
    name "Barney Stinson"
    email "awesome@legendary.com"
  end

  factory :order do
    amount 1000
    user
  end

  factory :order_item do
    order
    item
  end

  sequence :name do |n|
    "Barney Stinson#{n}"
  end

  sequence :email do |n|
    "awesome#{n}@legendary.com"
  end
end
