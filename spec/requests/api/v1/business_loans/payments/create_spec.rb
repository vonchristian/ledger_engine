# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/business_loans/#id/payments', type: :request do
  context 'with valid params' do
    let(:bank)          { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:business_loan) { FactoryBot.create(:business_loan, institution: bank) }
    let(:cash_account)  { FactoryBot.create(:asset, name: 'Cash in Bank') }

    it 'creates a business loan payment' do
      # loan disbursement
      disbursement_entry = FactoryBot.build(:entry, institution: bank)
      disbursement_entry.debit_amounts.build(amount: 10_000, account: business_loan.receivable_account)
      disbursement_entry.credit_amounts.build(amount: 10_000, account: cash_account)
      disbursement_entry.save!

      url     = "/api/v1/business_loans/#{business_loan.id}/payments"
      params  = { business_loans_payment: {
        amount: 10_000,
        cash_account_id: cash_account.id,
        reference_number: '123456',
        description: 'loan payment'
         } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)
    end
  end
end
