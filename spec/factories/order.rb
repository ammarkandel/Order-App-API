FactoryBot.define do
  price_array = %w[500 200 3000]
  user_ids = %w[ 1 2 3 4 5 ]

  factory :order do
    total_price { price_array.sample }
    user_id { user_ids.sample }
  end
end
