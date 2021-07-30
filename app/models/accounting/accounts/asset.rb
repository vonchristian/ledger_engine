# frozen_string_literal: true

module Accounting
  module Accounts
    class Asset < ApplicationRecord
      include Accounting::Accounts::Associations::AmountsAssociation
      include Accounting::Accounts::Associations::EntriesAssociation
      include Accounting::Accounts::Balances::Individual

      class_attribute :normal_credit_balance
      self.normal_credit_balance = false

      belongs_to :institution, polymorphic: true

      validates :name, :code, presence: true
    end
  end
end
