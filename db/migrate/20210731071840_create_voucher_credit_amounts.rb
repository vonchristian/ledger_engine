class CreateVoucherCreditAmounts < ActiveRecord::Migration[6.1]
  def change
    create_table :voucher_credit_amounts, id: :uuid do |t|
      t.references :account, polymorphic: true, null: false, type: :uuid
      t.integer :amount_cents, null: false
      t.belongs_to :voucher, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
