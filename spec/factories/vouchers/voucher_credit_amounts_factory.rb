FactoryBot.define do
  factory :voucher_credit_amount, class: Vouchers::VoucherCreditAmount do
    association :account, factory: :asset
    amount_cents { 1 }
    association :voucher
  end
end
