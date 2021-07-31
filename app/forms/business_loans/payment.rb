module BusinessLoans
  class Payment
    include ActiveModel::Model

    attr_accessor :cash_account_id, :amount, :reference_number, :description, :business_loan_id

    validates :cash_account_id, :amount, :reference_number, :description, :business_loan_id, presence: true
    validates :amount, numericality: { greater_than: 0 }

    def process!
      return unless valid?

      ApplicationRecord.transaction do
        create_payment_entry
      end
    end

    def find_business_loan
      Loans::LoanTypes::BusinessLoan.find_by(id: business_loan_id)
    end

    def find_cash_account
      Accounting::Accounts::Asset.find(cash_account_id)
    end

    private

    def create_payment_entry
      entry = Accounting::Entry.new(
        reference_number: reference_number,
        entry_date: Date.current,
        entry_time: Time.zone.now,
        description: description,
        institution: find_business_loan.institution,
        recording_type: 'automated'
      )
      entry.debit_amounts.build(account: find_cash_account, amount: BigDecimal(amount))
      entry.credit_amounts.build(account: find_business_loan.receivable_account, amount: BigDecimal(amount))
      entry.save!
    end
  end
end
