module Wallets
  class TopupByBank
    include ActiveModel::Model

    attr_accessor :wallet_id, :bank_account_id, :amount, :reference_number

    def process!
      if valid?
        ApplicationRecord.transaction do
          create_topup_entry
        end
      end
    end

    private

    def create_topup_entry
      entry = Accounting::Entry.new(
        reference_number: reference_number,
        entry_date: Date.current,
        entry_time: Time.zone.now,
        description: 'Topup by bank',
        institution: find_wallet.institution,
        recording_type: 'automated'
      )
      entry.debit_amounts.build(account: find_bank_account, amount: BigDecimal(amount))
      entry.credit_amounts.build(account: find_wallet.wallet_account, amount: BigDecimal(amount))
      entry.save!
    end

    def find_wallet
      Wallet.find(wallet_id)
    end

    def find_bank_account
      Accounting::Accounts::Asset.find(bank_account_id)
    end
  end
end
