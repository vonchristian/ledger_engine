# frozen_string_literal: true

module Businesses
  class Corporation < ApplicationRecord
    include Businesses::Associations::WalletsAssociation

    validates :business_name, presence: true

    def name
      business_name
    end
  end
end
