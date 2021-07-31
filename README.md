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
### Business Savings
 - Open an account `/api/v1/business_saving_openings`
 - Deposits `/api/v1/business_savings/:id/deposits`
 - Withdrawals `/api/v1/business_savings/:id/withdrawals`



