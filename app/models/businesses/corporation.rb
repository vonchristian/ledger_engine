module Businesses
  class Corporation < ApplicationRecord
    validates :business_name, presence: true

    def name
      business_name
    end
  end
end
