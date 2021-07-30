# frozen_string_literal: true

module Accounting
  module Amounts
    class CreditAmount < ApplicationRecord
      extend Accounting::Amounts::Balancing

      monetize :amount_cents, as: :amount

      belongs_to :account, polymorphic: true
      belongs_to :entry, class_name: 'Accounting::Entry'
    end
  end
end
