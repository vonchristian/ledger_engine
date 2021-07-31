class AddAccountNumberToBusinessLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :business_loans, :account_number, :string
    add_index :business_loans, :account_number, unique: true
  end
end
