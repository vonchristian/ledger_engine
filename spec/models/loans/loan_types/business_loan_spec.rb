require 'rails_helper'

module Loans
  module LoanTypes
    RSpec.describe BusinessLoan, type: :model do
      describe 'associations' do
        it { is_expected.to belong_to :business }
        it { is_expected.to belong_to :receivable_account }
        it { is_expected.to belong_to :institution }

      end
    end
  end
end
