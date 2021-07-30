module Accounting
  module Accounts
    module Balances
      module Individual

        def balance(args = {})
          if normal_credit_balance ^ contra?
            credits_balance(args) - debits_balance(args)
          else
            debits_balance(args) - credits_balance(args)
          end
        end

        def credits_balance(args={})
          credit_amounts.balance(args)
        end

        def debits_balance(args={})
          debit_amounts.balance(args)
        end
      end
    end
  end
end
