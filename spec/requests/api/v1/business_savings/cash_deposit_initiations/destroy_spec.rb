# frozen_string_literal: true

require 'rails_helper'

describe 'GET /api/v1/business_savings/:id/cash_deposit_initiations/:id/', type: :request do
  context 'with valid params' do
    let(:bank)            { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)     { FactoryBot.create(:corporation) }
    let(:cash_account)    { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:business_saving) { FactoryBot.create(:business_saving, business: corporation, institution: bank) }

    it 'create a business saving cash deposit initiation' do
      deposit_voucher = FactoryBot.build(:voucher, institution: bank)
      deposit_voucher.debit_amounts.build(amount: 1000, account: cash_account)
      deposit_voucher.credit_amounts.build(amount: 1000, account: business_saving.depository_account)
      deposit_voucher.save!

      url = "/api/v1/business_savings/#{business_saving.id}/cash_deposit_initiations/#{deposit_voucher.id}/"

      delete(url)

      expect(Voucher.all.size).to eq 0
    end
  end
end
