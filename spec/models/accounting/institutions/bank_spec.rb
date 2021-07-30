require 'rails_helper'

module Institutions
  RSpec.describe Bank, type: :model do
    describe 'validations' do
      it { is_expected.to validate_presence_of :bank_name }
      it { is_expected.to validate_uniqueness_of :bank_name }
    end
  end
end
