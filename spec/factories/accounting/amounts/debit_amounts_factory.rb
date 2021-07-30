FactoryBot.define do
  factory :debit_amount, class: Accounting::Amounts::DebitAmount do
    association :account, factory: :asset
    amount_cents { 1000 }
    association :entry, factory: :entry_with_debit_and_credit
  end
end
