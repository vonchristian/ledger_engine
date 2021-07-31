require 'rails_helper'

module Wallets
  module AccountTypes
    RSpec.describe BusinessWallet, type: :model do
      describe 'associations' do
        it { is_expected.to belong_to :business }
        it { is_expected.to belong_to :wallet }
      end
    end
  end
end
