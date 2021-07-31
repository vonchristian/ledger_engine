# frozen_string_literal: true

require 'rails_helper'

describe 'POST /api/v1/business_saving_openings', type: :request do
  context 'with valid params' do
    let(:bank)          { FactoryBot.create(:bank, bank_name: 'First Circle Bank') }
    let(:corporation)   { FactoryBot.create(:corporation) }


    it 'create a business saving' do

      url     = '/api/v1/business_saving_openings'
      params  = { business_saving_openings: {
        account_number: '123-456-789',
        institution_type: bank.class.to_s,
        institution_id: bank.id,
        business_type: corporation.class.to_s,
        business_id: corporation.id
         } }

      post(url, params: params)

      expect(response).to have_http_status(:ok)
    end
  end
end
