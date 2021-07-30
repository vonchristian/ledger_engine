# frozen_string_literal: true

module Accounting
  module Accounts
    class Equity < ApplicationRecord
      include Accounting::Accounts::Associations::AmountsAssociation
      include Accounting::Accounts::Associations::EntriesAssociation

      class_attribute :normal_credit_balance
      self.normal_credit_balance = true

      belongs_to :institution, polymorphic: true

      validates :name, :code, presence: true
    end
  end
end
