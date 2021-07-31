require 'rails_helper'

module CreditLines
  module AccountTypes
    RSpec.describe BusinessCreditLine, type: :model do
      describe 'associations' do
        it { is_expected.to belong_to :business }
        it { is_expected.to belong_to :current_receivable_account }
        it { is_expected.to belong_to :past_due_receivable_account }
        it { is_expected.to belong_to :interest_revenue_account }
        it { is_expected.to belong_to :penalty_revenue_account }
        it { is_expected.to belong_to :institution }
      end

      describe 'validations' do
        it { is_expected.to validate_presence_of :account_number }
        it 'is_expected.to validate_uniqueness_of :account_number' do
          FactoryBot.create(:business_credit_line, account_number: '11111111')
          credit_line = FactoryBot.build(:business_credit_line, account_number: '11111111')
          credit_line.save

          expect(credit_line.errors[:account_number]).to eq(['has already been taken'])
        end
      end
    end
  end
end
