# Ledger Engine API

## Proof of concept to implement a ledger for:
1. Tracking movement of money
2. Computing balances of an account
3. Auditing entries to an account
4. Generate balance sheet
5. Generate income statement
## Transaction Workflow
To allow corrections, validations, and previewing a transaction before it is finally recorded, We follow the following pattern:
1. Initiation -> Create voucher
2. Preview -> Show voucher
3. (Cancellation) -> Delete voucher
4. Confirmation -> Create a journal entry
## API Use Cases
### Business Loans
 - Disbursements `/api/v1/business_loan_disbursements`
 - Payments `/api/v1/business_loans/:id/payments`

### Business Credit Lines
 - Drawdown to wallets `/api/v1/business_credit_lines/:id/drawdown_to_wallets`
  - Drawdown to business savings `/api/v1/business_credit_lines/:id/drawdown_to_business_savings`
### Business Savings
 - Open an account `/api/v1/business_saving_openings`
 - Get Balance `/api/v1/business_savings/:id/balance`

 - Cash Deposits
    - Initiation `/api/v1/business_savings/cash_deposit_initiations`
    - Preview `/api/v1/business_savings/cash_deposit_vouchers/:id`
    - Cancellation `/api/v1/business_savings/cash_deposit_vouchers/:id`
    - Confirmation `/api/v1/business_savings/:id/cash_deposit_confirmations`
 -  Cash Withdrawals
    - Initiation `/api/v1/business_savings/:id/cash_withdrawal_initiations`
    - Preview `/api/v1/business_savings/:id/cash_withdrawal_initiations/:id`
    - Cancellation `/api/v1/business_savings/:id/cash_withdrawal_initiations/:id`
    - Confirmation `/api/v1/business_savings/:id/cash_withdrawal_confirmations`



### Business Wallets
 - Open an account `/api/v1/business_wallet_openings`

### Wallets
 - Topup By Bank `/api/v1/wallets/:id/topup_by_banks`
 - Fund transfer to other wallets `/api/v1/wallets/:id/fund_transfer_to_wallets`
 - Fund transfer to savings `/api/v1/wallets/:id/fund_transfer_to_business_savings`


