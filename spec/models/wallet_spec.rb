require 'rails_helper'

RSpec.describe Wallet, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :institution }
    it { is_expected.to belong_to :wallet_account }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :account_number }
    it 'is_expected.to validate_uniqueness_of :account_number' do
      FactoryBot.create(:wallet, account_number: '123456')
      wallet = FactoryBot.build(:wallet, account_number: '123456')
      wallet.save

      expect(wallet.errors[:account_number]).to eq(['has already been taken'])
    end
  end
end
