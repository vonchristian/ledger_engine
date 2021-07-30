module Businesses
  class Corporation < ApplicationRecord
    validates :business_name, presence: true
  end
end
