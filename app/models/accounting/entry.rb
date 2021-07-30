# frozen_string_literal: true

module Accounting
  class Entry < ApplicationRecord
    enum recording_type: { manual: 'manual', automated: 'automated' }

    belongs_to :institution, polymorphic: true
    has_many :debit_amounts, class_name: 'Accounting::Amounts::DebitAmount'
    has_many :credit_amounts, class_name: 'Accounting::Amounts::DebitAmount'

    validates :entry_date, :entry_time, :reference_number, :description, :recording_type, presence: true
  end
end
