class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets, id: :uuid do |t|
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.belongs_to :wallet_account, null: false, foreign_key: { to_table: :liabilities }, type: :uuid
      t.string :account_number

      t.timestamps
    end
    add_index :wallets, :account_number, unique: true
  end
end
