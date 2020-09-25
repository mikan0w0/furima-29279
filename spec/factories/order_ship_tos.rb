FactoryBot.define do
  factory :order_ship_to do
    post_code     {"123-4567"}
    prefecture_id {3}
    city          {"福岡"}
    address       {"1-2-3"}
    building      {"福岡ビル"}
    phone         {12345678987}
    token         {Faker::Lorem.sentence}
  end
end
