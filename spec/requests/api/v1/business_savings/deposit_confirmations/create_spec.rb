# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/business_savings/:id/deposit_confirmations', type: :request do
  context 'with valid params' do
    let(:bank)            { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)     { FactoryBot.create(:corporation) }
    let(:cash_account)    { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:business_saving) { FactoryBot.create(:business_saving, business: corporation, institution: bank) }

    it 'create a business saving deposit confirmation' do
      deposit_voucher = FactoryBot.build(:voucher, institution: bank)
      deposit_voucher.debit_amounts.build(amount: 1000, account: cash_account)
      deposit_voucher.credit_amounts.build(amount: 1000, account: business_saving.depository_account)
      deposit_voucher.save!

      url     = "/api/v1/business_savings/#{business_saving.id}/deposit_confirmations"
      params  = { business_savings_deposit_confirmation: { deposit_voucher_id: deposit_voucher.id } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)

    end
  end
end
