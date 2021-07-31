# frozen_string_literal: true

module Accounting
  class Entry < ApplicationRecord
    enum recording_type: { manual: 'manual', automated: 'automated' }

    belongs_to :institution, polymorphic: true
    has_many :debit_amounts, class_name: 'Accounting::Amounts::DebitAmount'
    has_many :credit_amounts, class_name: 'Accounting::Amounts::CreditAmount'

    validates :entry_date, :entry_time, :reference_number, :description, :recording_type, presence: true
    validate :has_credit_amounts?
    validate :has_debit_amounts?
    validate :amounts_cancel?

    private

    # rubocop:disable Naming/PredicateName
    def has_credit_amounts?
      errors[:base] << 'Entry must have at least one credit amount' if credit_amounts.blank?
    end
    # rubocop:enable Naming/PredicateName

    def has_debit_amounts?
      errors[:base] << 'Entry must have at least one debit amount' if debit_amounts.blank?
    end

    def amounts_cancel?
      errors[:base] << 'The credit and debit amounts are not equal' if credit_amounts.balance_for_new_record != debit_amounts.balance_for_new_record
    end
  end
end
