FactoryBot.define do
  factory :voucher do
    reference_number { SecureRandom.hex }
    description { "MyString" }
    association :institution, factory: :bank
  end
end
