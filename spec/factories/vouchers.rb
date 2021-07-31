FactoryBot.define do
  factory :txn_voucher do
    reference_number { "MyString" }
    description { "MyString" }
    institution { nil }
  end
end
