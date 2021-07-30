# frozen_string_literal: true

require 'rails_helper'

module Accounting
  RSpec.describe Entry, type: :model do
    describe 'associations' do
      it { is_expected.to belong_to :institution }
      it { is_expected.to have_many :debit_amounts }
      it { is_expected.to have_many :credit_amounts }
    end

    describe 'validations' do
      it { is_expected.to validate_presence_of :entry_date }
      it { is_expected.to validate_presence_of :entry_time }
      it { is_expected.to validate_presence_of :reference_number }
      it { is_expected.to validate_presence_of :description }
    end

    describe 'enums' do
      it { is_expected.to define_enum_for(:recording_type).with_values(manual: 'manual', automated: 'automated').backed_by_column_of_type(:string) }
    end
  end
end
