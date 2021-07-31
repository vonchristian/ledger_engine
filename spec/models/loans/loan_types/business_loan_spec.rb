require 'rails_helper'

module Loans
  module LoanTypes
    RSpec.describe BusinessLoan, type: :model do
      describe 'associations' do
        it { is_expected.to belong_to :business }
        it { is_expected.to belong_to :receivable_account }
        it { is_expected.to belong_to :institution }
      end

      describe 'validations' do
        it { is_expected.to validate_presence_of :account_number }
        it 'is_expected.to validate_uniqueness_of :account_number' do
          FactoryBot.create(:business_loan, account_number: '123456789')
          business_loan = FactoryBot.build(:business_loan, account_number: '123456789')
          business_loan.save

          expect(business_loan.errors[:account_number]).to eq(['has already been taken'])
        end
      end
    end
  end
end
