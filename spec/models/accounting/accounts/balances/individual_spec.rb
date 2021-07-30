# frozen_string_literal: true

require 'rails_helper'

module Accounting
  module Accounts
    module Balances
      # rubocop:disable Metrics/BlockLength
      describe Individual do
        it '#balance' do
          cash_on_hand     = FactoryBot.create(:asset)
          funding          = FactoryBot.create(:equity)
          saving           = FactoryBot.create(:liability)
          loan             = FactoryBot.create(:asset)
          interest_revenue = FactoryBot.create(:revenue)
          employee_salary  = FactoryBot.create(:expense)

          # funding
          funding_entry = FactoryBot.build(:entry)
          funding_entry.debit_amounts.build(amount: 10_000, account: cash_on_hand)
          funding_entry.credit_amounts.build(amount: 10_000, account: funding)
          funding_entry.save!

          expect(cash_on_hand.balance).to eql 10_000
          expect(funding.balance).to eql 10_000

          # savings account deposit
          deposit_entry = FactoryBot.build(:entry)
          deposit_entry.debit_amounts.build(amount: 10_000, account: cash_on_hand)
          deposit_entry.credit_amounts.build(amount: 10_000, account: saving)
          deposit_entry.save!

          expect(cash_on_hand.balance).to eql 20_000
          expect(saving.balance).to eql 10_000

          # savings account withdrawal
          withdrawal_entry = FactoryBot.build(:entry)
          withdrawal_entry.debit_amounts.build(amount: 5_000, account: saving)
          withdrawal_entry.credit_amounts.build(amount: 5_000, account: cash_on_hand)
          withdrawal_entry.save!

          expect(cash_on_hand.balance).to eql 15_000
          expect(saving.balance).to eql 5_000

          # loan disbursement
          disbursement_entry = FactoryBot.build(:entry)
          disbursement_entry.debit_amounts.build(amount: 10_000, account: loan)
          disbursement_entry.credit_amounts.build(amount: 9_900, account: cash_on_hand)
          disbursement_entry.credit_amounts.build(amount: 100, account: interest_revenue)

          disbursement_entry.save!

          expect(cash_on_hand.balance).to eql 5_100
          expect(loan.balance).to eql 10_000
          expect(interest_revenue.balance).to eql 100

          # loan payment
          payment_entry = FactoryBot.build(:entry)
          payment_entry.debit_amounts.build(amount: 1_100, account: cash_on_hand)
          payment_entry.credit_amounts.build(amount: 1_000, account: loan)
          payment_entry.credit_amounts.build(amount: 100, account: interest_revenue)

          payment_entry.save!

          expect(cash_on_hand.balance).to eql 6_200
          expect(loan.balance).to eql 9_000
          expect(interest_revenue.balance).to eql 200

          # salary entry
          salary_entry = FactoryBot.build(:entry)
          salary_entry.debit_amounts.build(amount: 1_200, account: employee_salary)
          salary_entry.credit_amounts.build(amount: 1_200, account: cash_on_hand)

          salary_entry.save!

          expect(cash_on_hand.balance).to eql 5_000
          expect(employee_salary.balance).to eql 1_200
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
  end
end
