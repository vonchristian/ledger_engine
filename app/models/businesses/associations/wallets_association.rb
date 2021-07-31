module Businesses
  module Associations
    module WalletsAssociation
      extend ActiveSupport::Concern

      included do
        has_many :business_wallets, class_name: 'Wallets::AccountTypes::BusinessWallet', as: :business
        has_many :wallets, through: :business_wallets
      end
    end
  end
end
