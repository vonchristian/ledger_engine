module Vouchers
  class VoucherDebitAmount < ApplicationRecord
    monetize :amount_cents, as: :amount

    belongs_to :account, polymorphic: true
    belongs_to :voucher
  end
end
