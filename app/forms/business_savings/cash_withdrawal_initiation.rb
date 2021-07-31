module BusinessSavings
  class CashWithdrawalInitiation
    include ActiveModel::Model

    attr_accessor :business_saving_id, :cash_account_id, :amount, :reference_number, :description

    def process!
      if valid? && enough_balance?
        ApplicationRecord.transaction do
          create_voucher
        end
      end
    end

    private

    def enough_balance?
      find_business_saving.balance >= BigDecimal(amount)
    end

    def create_voucher
      voucher = Voucher.new(
        reference_number: reference_number,
        description: 'Cash withdrawal',
        institution: find_business_saving.institution
      )
      voucher.debit_amounts.build(account: find_business_saving.depository_account, amount: BigDecimal(amount))
      voucher.credit_amounts.build(account: find_cash_account, amount: BigDecimal(amount))
      voucher.save!
    end

    def find_business_saving
      Savings::AccountTypes::BusinessSaving.find(business_saving_id)
    end

    def find_cash_account
      Accounting::Accounts::Asset.find(cash_account_id)
    end
  end
end
