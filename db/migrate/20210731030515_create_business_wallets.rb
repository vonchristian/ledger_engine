class CreateBusinessWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :business_wallets, id: :uuid do |t|
      t.references :business, polymorphic: true, null: false, type: :uuid
      t.belongs_to :wallet, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
