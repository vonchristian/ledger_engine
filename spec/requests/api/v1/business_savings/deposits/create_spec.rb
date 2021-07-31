# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/business_savings/:id/deposits', type: :request do
  context 'with valid params' do
    let(:bank)            { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)     { FactoryBot.create(:corporation) }
    let(:cash_account)    { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:business_saving) { FactoryBot.create(:business_saving, business: corporation, institution: bank) }

    it 'create a business saving deposit' do

      url     = "/api/v1/business_savings/#{business_saving.id}/deposits"
      params  = { business_savings_deposit: {
        reference_number: '123-456-789',
        description: 'deposit',
        cash_account_id: cash_account.id,
        amount: 10_000 } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)

    end
  end
end
