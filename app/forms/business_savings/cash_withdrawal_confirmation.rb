module BusinessSavings
  class CashWithdrawalConfirmation
    include ActiveModel::Model

    attr_accessor :business_saving_id, :cash_withdrawal_voucher_id

    def process!
      if valid?
        ApplicationRecord.transaction do
          create_entry
        end
      end
    end

    def find_voucher
      Voucher.find(cash_withdrawal_voucher_id)
    end

    private

    def create_entry
      entry = Accounting::Entry.new(
        reference_number: find_voucher.reference_number,
        entry_date: Date.current,
        entry_time: Time.zone.now,
        description: find_voucher.description,
        institution: find_voucher.institution,
        recording_type: 'automated'
      )
      find_voucher.debit_amounts.each do |amount|
        entry.debit_amounts.build(account: amount.account, amount: amount.amount)
      end

      find_voucher.credit_amounts.each do |amount|
        entry.credit_amounts.build(account: amount.account, amount: amount.amount)
      end

      entry.save!
    end

    def find_business_saving
      Savings::AccountTypes::BusinessSaving.find(business_saving_id)
    end
  end
end
