FactoryBot.define do

  factory :user do
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    middle_name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
    password { '12345678' }
  end
end
