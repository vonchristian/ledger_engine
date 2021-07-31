FactoryBot.define do
  factory :business_saving, class: Savings::AccountTypes::BusinessSaving do
    account_number { SecureRandom.hex }
    association :institution, factory: :bank
    association :depository_account, factory: :liability
  end
end
