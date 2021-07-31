# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/business_loan_disbursements', type: :request do
  context 'with valid params' do
    let(:bank)          { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:cash_account)  { FactoryBot.create(:asset, name: 'Cash in Bank', institution: bank) }
    let(:equity)        { FactoryBot.create(:equity, name: 'Funding', institution: bank) }
    let(:corporation)   { FactoryBot.create(:corporation) }


    it 'creates a business loan payment' do
      # funding capital
      funding_entry = FactoryBot.build(:entry, institution: bank)
      funding_entry.debit_amounts.build(amount: 100_000, account: cash_account)
      funding_entry.credit_amounts.build(amount: 100_000, account: equity)
      funding_entry.save!

      url     = '/api/v1/business_loan_disbursements'
      params  = { business_loans_disbursement: {
        amount: 10_000,
        cash_account_id: cash_account.id,
        account_number: '123456',
        business_type: corporation.class.to_s,
        business_id: corporation.id
         } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)

    end
  end
end
