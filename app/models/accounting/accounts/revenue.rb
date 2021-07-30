# frozen_string_literal: true

module Accounting
  module Accounts
    class Revenue < ApplicationRecord
      include Accounting::Accounts::Associations::AmountsAssociation
      include Accounting::Accounts::Associations::EntriesAssociation

      belongs_to :institution, polymorphic: true

      validates :name, :code, presence: true
    end
  end
end
