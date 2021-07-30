# frozen_string_literal: true

FactoryBot.define do
  factory :expense, class: Accounting::Accounts::Expense do
    association :institution, factory: :bank
    name { "Expense #{SecureRandom.hex}" }
    code { SecureRandom.hex }
    contra { false }
  end
end
