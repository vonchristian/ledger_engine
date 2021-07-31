# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/wallets/:id/fund_transfer_to_business_savings', type: :request do
  context 'with valid params' do
    let(:bank)            { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)     { FactoryBot.create(:corporation) }
    let(:bank_account)    { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:source_wallet)   { FactoryBot.create(:wallet, institution: bank) }
    let(:business_saving) { FactoryBot.create(:business_saving, institution: bank, business: corporation) }

    it 'create wallet fund trunsfer to business_saving' do
      # topup entry
      topup_entry = FactoryBot.build(:entry, institution: bank)
      topup_entry.debit_amounts.build(amount: 100_000, account: bank_account)
      topup_entry.credit_amounts.build(amount: 100_000, account: source_wallet.wallet_account)
      topup_entry.save!

      url     = "/api/v1/wallets/#{source_wallet.id}/fund_transfer_to_business_savings"
      params  = { wallets_fund_transfer_to_business_saving: {
        business_saving_id: business_saving.id,
        amount: 10_000 } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)
    end
  end
end
