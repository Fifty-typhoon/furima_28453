FactoryBot.define do
  factory :order_purchase do
    token          { Faker::Internet.password }
    post_number    { '123-4567' }
    prefecture_id  { Faker::Number.within(range: 2..48) }
    city           { Gimei.address.city.to_s }
    address        { Gimei.address.town.to_s }
    phone_number   { '12345678912' }

    # association :user , :item
  end
end
