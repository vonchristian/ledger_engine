module Loans
  module LoanTypes
    module BusinessLoans
      class AccountCreator
        def self.call(args = {})
          obj = new(args)
          obj.run
        end

        def run
          create_receivable_account
        end
      end
    end
  end
end
