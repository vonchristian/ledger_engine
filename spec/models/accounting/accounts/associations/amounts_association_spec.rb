# frozen_string_literal: true

require 'rails_helper'

module Accounting
  module Accounts
    module Associations
      RSpec.describe AmountsAssociation do
        describe 'associations' do
          let(:asset) { FactoryBot.create(:asset) { include Accounting::Accounts::Associations::AmountsAssociation } }
          let(:liability) { FactoryBot.create(:liability) { include Accounting::Accounts::Associations::AmountsAssociation } }
          let(:equity) { FactoryBot.create(:equity) { include Accounting::Accounts::Associations::AmountsAssociation } }
          let(:revenue) { FactoryBot.create(:revenue) { include Accounting::Accounts::Associations::AmountsAssociation } }
          let(:expense) { FactoryBot.create(:expense) { include Accounting::Accounts::Associations::AmountsAssociation } }


          it { expect(asset).to have_many :debit_amounts }
          it { expect(asset).to have_many :credit_amounts }

          it { expect(liability).to have_many :debit_amounts }
          it { expect(liability).to have_many :credit_amounts }

          it { expect(equity).to have_many :debit_amounts }
          it { expect(equity).to have_many :credit_amounts }

          it { expect(revenue).to have_many :debit_amounts }
          it { expect(revenue).to have_many :credit_amounts }

          it { expect(expense).to have_many :debit_amounts }
          it { expect(expense).to have_many :credit_amounts }
        end
      end
    end
  end
end
