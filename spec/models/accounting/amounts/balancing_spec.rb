# frozen_string_literal: true

require 'rails_helper'

module Accounting
  module Amounts
    RSpec.describe Balancing do
      describe '.total' do
        let(:debit_amount) { FactoryBot.create(:debit_amount, amount: 1_000) { include Accounting::Amounts::Balancing } }
        let(:credit_amount) { FactoryBot.create(:credit_amount, amount: 1_000) { include Accounting::Amounts::Balancing } }

        it { expect(debit_amount.class.total).to eq 1_000 }
        it { expect(credit_amount.class.total).to eq 1_000 }
      end
    end
  end
end
