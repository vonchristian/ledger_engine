# frozen_string_literal: true

require 'rails_helper'

module Accounting
  module Accounts
    RSpec.describe Liability, type: :model do
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
