# frozen_string_literal: true

module Businesses
  class Corporation < ApplicationRecord
    include Businesses::Associations::WalletsAssociation
    has_many :credit_lines, class_name: 'CreditLines::AccountTypes::BusinessCreditLine', as: :business
    validates :business_name, presence: true

    def name
      business_name
    end
  end
end
