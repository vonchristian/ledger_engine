# frozen_string_literal: true

require 'rails_helper'

module Accounting
  module Accounts
    RSpec.describe Revenue, type: :model do
      describe 'normal credit balance' do
        it { expect(described_class.normal_credit_balance).to eql true }
      end

      describe 'associations' do
        it { is_expected.to belong_to :institution }
      end

      describe 'validations' do
        it { is_expected.to validate_presence_of :name }
        it { is_expected.to validate_presence_of :code }
      end
    end
  end
end
