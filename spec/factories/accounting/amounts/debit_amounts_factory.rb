FactoryBot.define do
  factory :debit_amount, class: Accounting::Amounts::DebitAmount do
    association :account, factory: :asset
    amount_cents { 200 }
    association :entry
  end
end
