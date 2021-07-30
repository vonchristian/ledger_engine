# frozen_string_literal: true

FactoryBot.define do
  factory :liability, class: Accounting::Accounts::Liability do
    institution { nil }
    name { "Asset #{SecureRandom.hex}" }
    code { SecureRandom.hex }
    contra { false }
  end
end
