FactoryBot.define do
  factory :voucher_debit_amount, class: Vouchers::VoucherDebitAmount do
    association :account, factory: :asset
    amount_cents { 1 }
    association :voucher
  end
end
