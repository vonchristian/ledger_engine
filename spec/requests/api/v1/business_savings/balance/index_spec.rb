# frozen_string_literal: true

require 'rails_helper'

describe 'GET /api/v1/business_savings/:id/balance', type: :request do
  context 'with valid params' do
    let(:bank)            { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)     { FactoryBot.create(:corporation) }
    let(:cash_account)    { FactoryBot.create(:asset, name: "Cash on Hand", institution: bank) }
    let(:business_saving) { FactoryBot.create(:business_saving, business: corporation, institution: bank) }

    it 'get a business saving balance' do
      deposit_entry = FactoryBot.build(:entry, institution: bank)
      deposit_entry.debit_amounts.build(amount: 100_000, account: cash_account)
      deposit_entry.credit_amounts.build(amount: 100_000, account: business_saving.depository_account)
      deposit_entry.save!

      url = "/api/v1/business_savings/#{business_saving.id}/balance"

      get(url)

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq({'id' => business_saving.id, 'account_number' => business_saving.account_number, 'as_of_date' => Date.current.strftime('%D'), 'balance' => '100000.0' } )
    end
  end
end
