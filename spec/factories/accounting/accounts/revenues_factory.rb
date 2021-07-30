# frozen_string_literal: true

FactoryBot.define do
  factory :revenue, class: Accounting::Accounts::Revenue do
    institution { nil }
    name { "Revenue #{SecureRandom.hex}" }
    code { SecureRandom.hex }
    contra { false }
  end
end
