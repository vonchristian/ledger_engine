# frozen_string_literal: true

# Temporary record for a transaction details
# Create debits and credits that would be recorded to an entry

class Voucher < ApplicationRecord
  belongs_to :institution, polymorphic: true
  belongs_to :entry, optional: true, class_name: 'Accounting::Entry'

  validates :reference_number, :description, presence: true
end
