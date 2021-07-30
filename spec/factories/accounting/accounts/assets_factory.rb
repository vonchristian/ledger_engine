# frozen_string_literal: true

FactoryBot.define do
  factory :asset, class: Accounting::Accounts::Asset do
    institution { nil }
    name { "Asset #{SecureRandom.hex}" }
    code { "#{SecureRandom.hex}" }
    contra { false }
  end
end
