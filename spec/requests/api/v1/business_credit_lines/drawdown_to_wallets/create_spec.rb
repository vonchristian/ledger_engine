# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/business_credit_lines_drawdown_to_wallets', type: :request do
  context 'with valid params' do
    let(:bank)          { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:cash_account)  { FactoryBot.create(:asset, name: 'Cash in Bank', institution: bank) }
    let(:equity)        { FactoryBot.create(:equity, name: 'Funding', institution: bank) }
    let(:corporation)   { FactoryBot.create(:corporation) }
    let(:wallet)        { FactoryBot.create(:wallet) }
    let(:business_credit_line) { FactoryBot.create(:business_credit_line, business: corporation, institution: bank) }

    it 'creates a business credit line drawdown to wallet' do
      corporation.wallets << wallet

      url     = "/api/v1/business_credit_lines/#{business_credit_line.id}/drawdown_to_wallets"
      params  = { business_credit_lines_drawdown_to_wallet: {
        amount: 10_000,
        wallet_id: wallet.id,
        account_number: '123456'
         } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)
    end
  end
end
