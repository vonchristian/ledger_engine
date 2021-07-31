# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/wallets/:id/fund_transfer_to_wallets', type: :request do
  context 'with valid params' do
    let(:bank)               { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)        { FactoryBot.create(:corporation) }
    let(:bank_account)       { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:source_wallet)      { FactoryBot.create(:wallet, institution: bank) }
    let(:destination_wallet) { FactoryBot.create(:wallet, institution: bank) }


    it 'create wallet fund trunsfer to other wallet' do
      # topup entry
      topup_entry = FactoryBot.build(:entry, institution: bank)
      topup_entry.debit_amounts.build(amount: 100_000, account: bank_account)
      topup_entry.credit_amounts.build(amount: 100_000, account: source_wallet.wallet_account)
      topup_entry.save!

      url     = "/api/v1/wallets/#{source_wallet.id}/fund_transfer_to_wallets"
      params  = { wallets_fund_transfer_to_wallet: {
        destination_wallet_id: destination_wallet.id,
        amount: 10_000 } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)
    end
  end
end
