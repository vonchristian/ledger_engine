FactoryBot.define do
  factory :credit_amount, class: Accounting::Amounts::CreditAmount do
    association :account, factory: :asset
    amount_cents { 200 }
    association :entry
  end
end
