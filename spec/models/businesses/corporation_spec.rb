# frozen_string_literal: true

require 'rails_helper'

module Businesses
  RSpec.describe Corporation, type: :model do
    describe 'associations' do
      it { is_expected.to have_many :credit_lines }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :business_name }
    end
  end
end
