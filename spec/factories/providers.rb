FactoryBot.define do
  factory :provider do
    name { Faker::Name.name }
    nit { Faker::Number.number }
    contact_number { Faker::Number.number(digits: 10) }
    contact_name { Faker::Name.name }
  end

  trait :with_bank_account do
    after(:create) do |provider|
      create(:bank_account, provider: provider)
    end
  end
end
