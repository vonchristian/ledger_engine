module Accounting
  module Accounts
    module Associations
      module AmountsAssociation
        extend ActiveSupport::Concern

        included do
          has_many :debit_amounts,  class_name: 'Accounting::Amounts::DebitAmount', as: :account
          has_many :credit_amounts, class_name: 'Accounting::Amounts::CreditAmount', as: :account
        end
      end
    end
  end
end
