FactoryBot.define do
  factory :business_wallet do
    association :business, factory: :corporation
    association :wallet
  end
end
