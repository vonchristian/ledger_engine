module Loans
  module LoanTypes
    class BusinessLoan < ApplicationRecord
      belongs_to :business, polymorphic: true
      belongs_to :institution, polymorphic: true
      belongs_to :receivable_account, class_name: 'Accounting::Accounts::Asset', foreign_key: 'receivable_account_id'

      validates :account_number, presence: true, uniqueness: true
    end
  end
end
