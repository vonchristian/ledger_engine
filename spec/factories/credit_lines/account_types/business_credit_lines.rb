FactoryBot.define do
  factory :business_credit_line, class: CreditLines::AccountTypes::BusinessCreditLine do
    association :business, factory: :corporation
    account_number { SecureRandom.hex }
    association :current_receivable_account, factory: :asset
    association :past_due_receivable_account, factory: :asset
    association :interest_revenue_account, factory: :revenue
    association :penalty_revenue_account, factory: :revenue
    association :institution, factory: :bank
  end
end
