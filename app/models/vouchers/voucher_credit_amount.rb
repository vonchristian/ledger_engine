module Vouchers
  class VoucherCreditAmount < ApplicationRecord
    belongs_to :account, polymorphic: true
    belongs_to :voucher
  end
end
