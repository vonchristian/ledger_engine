# frozen_string_literal: true

module BusinessLoans
  class Disbursement
    include ActiveModel::Model

    attr_accessor :account_number, :cash_account_id, :amount, :business_type, :business_id

    validates :account_number, :cash_account_id, :amount, presence: true
    validates :amount, presence: true

    def process!
      if valid?
        ApplicationRecord.transaction do
          create_business_loan
          create_disbursement_entry
        end
      end
    end

    def find_business_loan
      Loans::LoanTypes::BusinessLoan.find_by(account_number: account_number)
    end

    def find_business
      business_type.constantize.find(business_id)
    end

    def find_cash_account
      Accounting::Accounts::Asset.find(cash_account_id)
    end

    private
    def create_business_loan
      Loans::LoanTypes::BusinessLoan.create!(
        institution: find_cash_account.institution,
        account_number:     account_number,
        business:           find_business,
        receivable_account: create_receivable_account
      )
    end

    def create_receivable_account
      Accounting::Accounts::Asset.create!(
        name: "Business Loan #{account_number}",
        code: account_number,
        institution: find_cash_account.institution)
    end

    def create_disbursement_entry
      entry = Accounting::Entry.new(
        reference_number: account_number,
        entry_date: Date.current,
        entry_time: Time.zone.now,
        description: "Business loan disbursement - #{account_number}",
        institution: find_cash_account.institution,
        recording_type: 'automated'
      )
      entry.debit_amounts.build(account: find_business_loan.receivable_account, amount: BigDecimal(amount))
      entry.credit_amounts.build(account: find_cash_account, amount: BigDecimal(amount))
      entry.save!
    end
  end
end
