FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"山田"}
    family_name           {"太朗"}
    first_kana            {"ヤマダ"}
    family_kana           {"タロウ"}
    birth_date            {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end