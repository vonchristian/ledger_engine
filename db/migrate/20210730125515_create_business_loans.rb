class CreateBusinessLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :business_loans, id: :uuid do |t|
      t.references :business, polymorphic: true, null: false, type: :uuid
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.belongs_to :receivable_account, null: false, foreign_key: { to_table: :assets }, type: :uuid

      t.timestamps
    end
  end
end
