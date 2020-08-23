FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Gimei.name.first}
    last_name             {Gimei.name.last}
    kana_first_name       {first_name.katakana}
    kana_last_name        {last_name.katakana}
    birthday              {Faker::Date.birthday}
  end
end