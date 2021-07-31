class CreateBusinessCreditLines < ActiveRecord::Migration[6.1]
  def change
    create_table :business_credit_lines, id: :uuid do |t|
      t.references :business, polymorphic: true, null: false, type: :uuid
      t.string :account_number
      t.belongs_to :current_receivable_account, null: false, foreign_key: { to_table: :assets }, type: :uuid
      t.belongs_to :past_due_receivable_account, null: false, foreign_key: { to_table: :assets }, type: :uuid
      t.belongs_to :interest_revenue_account, null: false, foreign_key: { to_table: :revenues }, type: :uuid
      t.belongs_to :penalty_revenue_account, null: false, foreign_key: { to_table: :revenues }, type: :uuid
      t.references :institution, polymorphic: true, null: false, type: :uuid

      t.timestamps
    end
    add_index :business_credit_lines, :account_number, unique: true
  end
end
