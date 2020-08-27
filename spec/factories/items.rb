FactoryBot.define do
  factory :item do
    #image                 {Faker::LoremFlickr.image}
    name                  {Faker::Lorem.word}
    detail                {Faker::Lorem.sentence}
    category_id           {Faker::Number.within(range: 1..12)}
    state_id              {Faker::Number.within(range: 2..7)}
    delivery_fee_id       {Faker::Number.within(range: 2..3)}
    ship_from_location_id {Faker::Number.within(range: 2..48)}
    delivery_date_id      {Faker::Number.within(range: 2..4)}
    price                 {Faker::Number.within(range: 300..9999999)}
    # user_id               {Faker::Number.non_zero_digit}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'image', 'test.jpg')), filename: 'test.jpg')
    end
  end
end
