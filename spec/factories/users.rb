FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "admin-#{n}@example.com"
    end
    password { "Aa1!#{SecureRandom.base64(31)}" }
  end
end
