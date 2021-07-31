# frozen_string_literal: true

require 'rails_helper'

module Vouchers
  RSpec.describe VoucherCreditAmount, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :account }
      it { is_expected.to belong_to :voucher }
    end
  end
end

