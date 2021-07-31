# Ledger Engine

## Proof of concept to implement double-entry accounting for:
1. Tracking movement of money
2. Computing balances of an account
3. Auditing entries to an account
4. Generate balance sheet
5. Generate income statement

## API Use Cases
### Business Loans
 - Disbursements `/api/v1/business_loan_disbursements`
 - Payments `/api/v1/business_loans/:id/payments`

### Business Credit Lines
 - Drawdown to wallets `/api/v1/business_credit_lines/:id/drawdown_to_wallets`
  - Drawdown to business savings `/api/v1/business_credit_lines/:id/drawdown_to_business_savings`
### Business Savings
 - Open an account `/api/v1/business_saving_openings`
 - Deposits `/api/v1/business_savings/:id/deposits`
 - Withdrawals `/api/v1/business_savings/:id/withdrawals`
 - Balance `/api/v1/business_savings/:id/balance`

### Business Wallets
 - Open an account `/api/v1/business_wallet_openings`

### Wallets
 - Topup By Bank `/api/v1/wallets/:id/topup_by_banks`
 - Fund transfer to other wallets `/api/v1/wallets/:id/fund_transfer_to_wallets`
 - Fund transfer to savings `/api/v1/wallets/:id/fund_transfer_to_business_savings`


