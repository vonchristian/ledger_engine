# frozen_string_literal: true

module Accounting
  module Accounts
    class Equity < ApplicationRecord
      include Accounting::Accounts::Associations::AmountsAssociation

      belongs_to :institution, polymorphic: true

      validates :name, :code, presence: true
    end
  end
end
