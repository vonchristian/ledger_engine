FactoryBot.define do
  factory :business_loan, class: Loans::LoanTypes::BusinessLoan do
    association :business, factory: :corporation
    association :receivable_account, factory: :asset
    association :institution, factory: :bank
    account_number { SecureRandom.hex }
  end
end
