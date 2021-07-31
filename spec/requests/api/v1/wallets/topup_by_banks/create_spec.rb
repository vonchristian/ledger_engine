# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/wallets/:id/topup_by_banks', type: :request do
  context 'with valid params' do
    let(:bank)            { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)     { FactoryBot.create(:corporation) }
    let(:bank_account)    { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:wallet)          { FactoryBot.create(:wallet, institution: bank) }

    it 'create a wallet topup' do
      url     = "/api/v1/wallets/#{wallet.id}/topup_by_banks"
      params  = { wallets_topup_by_bank: {
        reference_number: '123-456-789',
        bank_account_id: bank_account.id,
        amount: 10_000 } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)
    end
  end
end
