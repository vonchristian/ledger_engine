require 'rails_helper'

module Savings
  module AccountTypes
    RSpec.describe BusinessSaving, type: :model do
      describe 'associations' do
        it { is_expected.to belong_to :business }
        it { is_expected.to belong_to :institution }
        it { is_expected.to belong_to :depository_account }
      end

      describe 'validations' do
        it { is_expected.to validate_presence_of :account_number }
        it { is_expected.to validate_presence_of :account_number }
      end
    end
  end
end
