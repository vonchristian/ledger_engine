# frozen_string_literal: true

module Savings
  module AccountTypes
    class BusinessSaving < ApplicationRecord
      belongs_to :business, polymorphic: true
      belongs_to :institution, polymorphic: true
      belongs_to :depository_account, class_name: 'Accounting::Accounts::Liability', foreign_key: 'depository_account_id'

      validates :account_number, presence: true, uniqueness: true

      delegate :balance, to: :depository_account
    end
  end
end
