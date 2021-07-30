# frozen_string_literal: true

module Accounting
  module Accounts
    module Associations
      module EntriesAssociation
        extend ActiveSupport::Concern
        included do
          has_many :debit_entries, through: :debit_amounts, source: :entry, class_name: 'Accounting::Entry'
          has_many :credit_entries, through: :credit_amounts, source: :entry, class_name: 'Accounting::Entry'

          def entries
            ids = []
            ids << credit_entries.ids
            ids << debit_entries.ids
            Accounting::Entry.where(id: ids.compact.flatten.uniq)
          end
        end
      end
    end
  end
end
