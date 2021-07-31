class Wallet < ApplicationRecord
  belongs_to :institution, polymorphic: true
  belongs_to :wallet_account, class_name: 'Accounting::Accounts::Liability', foreign_key: 'wallet_account_id'

  validates :account_number, presence: true, uniqueness: true
end
