FactoryBot.define do
  factory :corporation, class: Businesses::Corporation do
    business_name { "Corporation #{SecureRandom.hex}" }
  end
end
