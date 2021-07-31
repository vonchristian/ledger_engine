# frozen_string_literal: true

module BusinessCreditLines
  class DrawdownToWallet
    include ActiveModel::Model

    attr_accessor :wallet_id, :amount, :business_credit_line_id

    validates :wallet_id, :amount, :business_credit_line_id, presence: true
    validates :amount, presence: true

    def process!
      if valid?
        ApplicationRecord.transaction do
          create_drawdown_entry
        end
      end
    end

    def find_business_credit_line
      CreditLines::AccountTypes::BusinessCreditLine.find(business_credit_line_id)
    end

    def find_institution
      find_business_credit_line.institution
    end

    private

    def create_drawdown_entry
      entry = Accounting::Entry.new(
        reference_number: SecureRandom.hex,
        entry_date: Date.current,
        entry_time: Time.zone.now,
        description: "Business credit line disbursement  to wallet",
        institution: find_institution,
        recording_type: 'automated'
      )
      entry.debit_amounts.build(account: find_business_credit_line.current_receivable_account, amount: BigDecimal(amount))
      entry.credit_amounts.build(account: find_wallet.wallet_account, amount: BigDecimal(amount))
      entry.save!

    end

    def find_wallet
      Wallet.find(wallet_id)
    end
  end
end
