# frozen_string_literal: true

require 'rails_helper'

module Businesses
  module Associations
    RSpec.describe WalletsAssociation do
      describe 'associations' do
        let(:corporation) { FactoryBot.create(:corporation) }

        it { expect(corporation).to have_many :business_wallets }
        it { expect(corporation).to have_many :wallets }
      end
    end
  end
end
