require 'rails_helper'

module Accounting
  module Amounts
    RSpec.describe DebitAmount, type: :model do
      describe 'monetize' do
        it { is_expected.to monetize(:amount) }
      end

      describe 'associations' do
        it { is_expected.to belong_to :account }
        it { is_expected.to belong_to :entry }
      end
    end
  end
end
