FactoryBot.define do
  factory :bank_account do
    bank
    number { Faker::Number.number(digits: 15) }
  end
end
