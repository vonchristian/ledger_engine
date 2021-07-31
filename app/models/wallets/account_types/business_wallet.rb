module Wallets
  module AccountTypes
    class BusinessWallet < ApplicationRecord
      belongs_to :business, polymorphic: true
      belongs_to :wallet
    end
  end
end
