# frozen_string_literal: true

FactoryBot.define do
  factory :expense, class: Accounting::Accounts::Expense do
    institution { nil }
    name { "Expense #{SecureRandom.hex}" }
    code { SecureRandom.hex }
    contra { false }
  end
end
