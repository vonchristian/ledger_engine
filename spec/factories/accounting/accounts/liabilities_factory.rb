# frozen_string_literal: true

FactoryBot.define do
  factory :liability, class: Accounting::Accounts::Liability do
    association :institution, factory: :bank
    name { "Liability #{SecureRandom.hex}" }
    code { SecureRandom.hex }
    contra { false }
  end
end
