# frozen_string_literal: true

require 'rails_helper'

describe 'GET /api/v1/business_savings/:id/cash_withdrawal_initiations/:id', type: :request do
  context 'with valid params' do
    let(:bank)            { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)     { FactoryBot.create(:corporation) }
    let(:cash_account)    { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:business_saving) { FactoryBot.create(:business_saving, business: corporation, institution: bank) }

    it 'preview a business saving cash withdrawal initiation' do
      voucher = FactoryBot.build(:voucher, institution: bank)
      voucher.debit_amounts.build(amount: 1000, account: business_saving.depository_account)
      voucher.credit_amounts.build(amount: 1000, account: cash_account)
      voucher.save!

      url = "/api/v1/business_savings/#{business_saving.id}/cash_withdrawal_initiations/#{voucher.id}"

      get(url)

      expect(response).to have_http_status(:ok)

    end
  end
end
