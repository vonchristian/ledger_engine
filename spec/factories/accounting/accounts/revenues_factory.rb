# frozen_string_literal: true

FactoryBot.define do
  factory :revenue, class: Accounting::Accounts::Revenue do
    association :institution, factory: :bank
    name { "Revenue #{SecureRandom.hex}" }
    code { SecureRandom.hex }
    contra { false }
  end
end
