module Vouchers
  class VoucherCreditAmount < ApplicationRecord
    monetize :amount_cents, as: :amount
    belongs_to :account, polymorphic: true
    belongs_to :voucher
  end
end
