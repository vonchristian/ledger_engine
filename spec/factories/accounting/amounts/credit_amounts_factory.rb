FactoryBot.define do
  factory :credit_amount, class: Accounting::Amounts::CreditAmount do
    association :account, factory: :asset
    amount_cents { 1000 }
    association :entry, factory: :entry_with_debit_and_credit
  end
end
