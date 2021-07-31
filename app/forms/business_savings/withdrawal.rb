module BusinessSavings
  class Withdrawal
    include ActiveModel::Model

    attr_accessor :business_saving_id, :cash_account_id, :amount, :reference_number, :description

    def process!
      if valid?
        ApplicationRecord.transaction do
          create_withdrawal_entry
        end
      end
    end

    private

    def create_withdrawal_entry
      entry = Accounting::Entry.new(
        reference_number: reference_number,
        entry_date: Date.current,
        entry_time: Time.zone.now,
        description: description,
        institution: find_business_saving.institution,
        recording_type: 'automated'
      )
      entry.debit_amounts.build(account: find_business_saving.depository_account, amount: BigDecimal(amount))
      entry.credit_amounts.build(account: find_cash_account, amount: BigDecimal(amount))
      entry.save!
    end

    def find_business_saving
      Savings::AccountTypes::BusinessSaving.find(business_saving_id)
    end

    def find_cash_account
      Accounting::Accounts::Asset.find(cash_account_id)
    end
  end
end
