# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/business_credit_lines/:id/drawdown_to_business_savings', type: :request do
  context 'with valid params' do
    let(:bank)                 { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)          { FactoryBot.create(:corporation) }
    let(:business_saving)      { FactoryBot.create(:business_saving, business: corporation, institution: bank) }
    let(:business_credit_line) { FactoryBot.create(:business_credit_line, business: corporation, institution: bank) }

    it 'creates a business credit line drawdown to wallet' do

      url     = "/api/v1/business_credit_lines/#{business_credit_line.id}/drawdown_to_business_savings"
      params  = { business_credit_lines_drawdown_to_business_saving: {
        amount: 10_000,
        business_saving_id: business_saving.id } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)
    end
  end
end
