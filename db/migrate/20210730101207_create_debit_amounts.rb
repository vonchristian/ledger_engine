class CreateDebitAmounts < ActiveRecord::Migration[6.1]
  def change
    create_table :debit_amounts, id: :uuid do |t|
      t.references :account, polymorphic: true, null: false, type: :uuid
      t.integer :amount_cents, limit: 8, null: false
      t.belongs_to :entry, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
