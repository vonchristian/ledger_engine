class CreateBusinessSavings < ActiveRecord::Migration[6.1]
  def change
    create_table :business_savings, id: :uuid do |t|
      t.string :account_number, null: false
      t.references :business, polymorphic: true, null: false, type: :uuid
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.belongs_to :depository_account, null: false, foreign_key: { to_table: :liabilities }, type: :uuid

      t.timestamps
    end
    add_index :business_savings, :account_number, unique: true
  end
end
