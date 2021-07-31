module Wallets
  class FundTransferToBusinessSaving
    include ActiveModel::Model

    attr_accessor :source_wallet_id, :business_saving_id, :amount

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
        description: 'Funnd transfer to business saving',
        institution: find_source_wallet.institution,
        recording_type: 'automated'
      )
      entry.debit_amounts.build(account: find_source_wallet.wallet_account, amount: BigDecimal(amount))
      entry.credit_amounts.build(account: find_business_saving.depository_account, amount: BigDecimal(amount))
      entry.save!
    end

    def find_source_wallet
      Wallet.find(source_wallet_id)
    end

    def find_business_saving
      Savings::AccountTypes::BusinessSaving.find(business_saving_id)
    end
  end
end
