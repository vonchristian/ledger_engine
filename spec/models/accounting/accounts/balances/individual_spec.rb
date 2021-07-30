# frozen_string_literal: true

require 'rails_helper'

module Accounting
  module Accounts
    module Balances
      describe Individual do
        it '#balance' do
          cash_on_hand = FactoryBot.create(:asset)
          equity = FactoryBot.create(:equity)

          saving= FactoryBot.create(:liability)

          #equity entry
          entry = FactoryBot.build(:entry)
          entry.debit_amounts.build(amount: 10_000, account: cash_on_hand)
          entry.credit_amounts.build(amount: 10_000, account: equity)
          entry.save!

          expect(cash_on_hand.balance).to eql 10_000
        end

      end
    end
  end
end
