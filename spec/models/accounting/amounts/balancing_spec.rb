# frozen_string_literal: true

require 'rails_helper'

module Accounting
  module Amounts
    RSpec.describe Balancing do
      describe '.total' do
        let(:entry) { FactoryBot.create(:entry_with_debit_and_credit) }
        let(:debit_amount) { entry.debit_amounts.first }
        let(:credit_amount) { entry.credit_amounts.first }

        it { expect(debit_amount.class.total).to eql 10 }
        it { expect(credit_amount.class.total).to eql 10 }
      end
    end
  end
end
