module CreditLines
  module AccountTypes
    class BusinessCreditLine < ApplicationRecord
      belongs_to :business, polymorphic: true
      belongs_to :current_receivable_account, class_name: 'Accounting::Accounts::Asset', foreign_key: 'current_receivable_account_id'
      belongs_to :past_due_receivable_account, class_name: 'Accounting::Accounts::Asset', foreign_key: 'past_due_receivable_account_id'
      belongs_to :interest_revenue_account, class_name: 'Accounting::Accounts::Revenue', foreign_key: 'interest_revenue_account_id'
      belongs_to :penalty_revenue_account, class_name: 'Accounting::Accounts::Revenue', foreign_key: 'penalty_revenue_account_id'
      belongs_to :institution, polymorphic: true

      validates :account_number, presence: true, uniqueness: true
    end
  end
end
