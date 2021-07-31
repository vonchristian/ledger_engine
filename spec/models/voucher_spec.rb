require 'rails_helper'

RSpec.describe Voucher, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :institution }
    it { is_expected.to belong_to(:entry).optional }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :reference_number }
    it { is_expected.to validate_presence_of :description }
  end
end
