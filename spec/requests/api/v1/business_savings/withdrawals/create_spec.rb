# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/business_savings/:id/withdrawals', type: :request do
  context 'with valid params' do
    let(:bank)            { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)     { FactoryBot.create(:corporation) }
    let(:cash_account)    { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:business_saving) { FactoryBot.create(:business_saving, business: corporation, institution: bank) }

    it 'create a business saving deposit' do
      # deposit entry
      deposit_entry = FactoryBot.build(:entry, institution: bank)
      deposit_entry.debit_amounts.build(amount: 100_000, account: cash_account)
      deposit_entry.credit_amounts.build(amount: 100_000, account: business_saving.depository_account)
      deposit_entry.save!

      url     = "/api/v1/business_savings/#{business_saving.id}/withdrawals"
      params  = { business_savings_withdrawal: {
        reference_number: '123-456-789',
        description: 'withdrawal',
        cash_account_id: cash_account.id,
        amount: 1_000 } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)

    end
  end
end
