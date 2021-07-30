# frozen_string_literal: true

require 'rails_helper'

module Accounting
  module Accounts
    module Associations
      RSpec.describe EntriesAssociation do
        describe 'associations' do
          let(:asset) { FactoryBot.create(:asset) { include Accounting::Accounts::Associations::EntriesAssociation } }
          let(:liability) { FactoryBot.create(:liability) { include Accounting::Accounts::Associations::EntriesAssociation } }
          let(:equity) { FactoryBot.create(:equity) { include Accounting::Accounts::Associations::EntriesAssociation } }
          let(:revenue) { FactoryBot.create(:revenue) { include Accounting::Accounts::Associations::EntriesAssociation } }
          let(:expense) { FactoryBot.create(:expense) { include Accounting::Accounts::Associations::EntriesAssociation } }


          it { expect(asset).to have_many :debit_entries }
          it { expect(asset).to have_many :credit_entries }
          it { expect(asset).to respond_to :entries }

          it { expect(liability).to have_many :debit_entries }
          it { expect(liability).to have_many :credit_entries }
          it { expect(liability).to respond_to :entries }

          it { expect(equity).to have_many :debit_entries }
          it { expect(equity).to have_many :credit_entries }
          it { expect(equity).to respond_to :entries }

          it { expect(revenue).to have_many :debit_entries }
          it { expect(revenue).to have_many :credit_entries }
          it { expect(revenue).to respond_to :entries }

          it { expect(expense).to have_many :debit_entries }
          it { expect(expense).to have_many :credit_entries }
          it { expect(expense).to respond_to :entries }
        end
      end
    end
  end
end
