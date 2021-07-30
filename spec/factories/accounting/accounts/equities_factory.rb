# frozen_string_literal: true

FactoryBot.define do
  factory :equity, class: Accounting::Accounts::Equity do
    institution { nil }
    name { "Equity #{SecureRandom.hex}" }
    code { SecureRandom.hex }
    contra { false }
  end
end
