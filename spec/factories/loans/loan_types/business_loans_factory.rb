FactoryBot.define do
  factory :business_loan, class: Loans::LoanTypes::BusinessLoan do
    association :business, factory: :corporation
    association :receivable_account, factory: :asset
    association :institution, factory: :bank
  end
end
