class CreateVouchers < ActiveRecord::Migration[6.1]
  def change
    create_table :vouchers, id: :uuid do |t|
      t.string :reference_number, null: false
      t.string :description, null: false
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.belongs_to :entry, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end
