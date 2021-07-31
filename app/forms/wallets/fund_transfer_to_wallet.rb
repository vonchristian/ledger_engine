module Wallets
  class FundTransferToWallet
    include ActiveModel::Model

    attr_accessor :source_wallet_id, :destination_wallet_id, :amount

    def process!
      if valid?
        ApplicationRecord.transaction do
          create_fund_transfer_entry
        end
      end
    end

    private

    def create_fund_transfer_entry
      entry = Accounting::Entry.new(
        reference_number: SecureRandom.hex,
        entry_date: Date.current,
        entry_time: Time.zone.now,
        description: 'Funnd transfer',
        institution: find_source_wallet.institution,
        recording_type: 'automated'
      )
      entry.debit_amounts.build(account: find_source_wallet.wallet_account, amount: BigDecimal(amount))
      entry.credit_amounts.build(account: find_destination_wallet.wallet_account, amount: BigDecimal(amount))
      entry.save!
    end

    def find_source_wallet
      Wallet.find(source_wallet_id)
    end

    def find_destination_wallet
      Wallet.find(destination_wallet_id)
    end
  end
end
