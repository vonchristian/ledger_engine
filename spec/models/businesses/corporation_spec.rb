require 'rails_helper'

module Businesses
  RSpec.describe Corporation, type: :model do
    describe 'validations' do
      it { is_expected.to validate_presence_of :business_name }
    end
  end
end
