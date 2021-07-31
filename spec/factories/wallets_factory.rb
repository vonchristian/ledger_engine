FactoryBot.define do
  factory :wallet do
    association :institution, factory: :bank
    association :wallet_account, factory: :liability
    account_number { SecureRandom.hex }
  end
end
