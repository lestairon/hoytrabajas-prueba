FactoryBot.define do
  factory :provider do
    bank_account
    name { Faker::Name.name }
    nit { Faker::Number.number }
    contact_number { Faker::Number.number(digits: 10) }
    contact_name { Faker::Name.name }
  end
end
