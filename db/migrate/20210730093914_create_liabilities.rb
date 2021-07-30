class CreateLiabilities < ActiveRecord::Migration[6.1]
  def change
    create_table :liabilities, id: :uuid do |t|
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.string :name
      t.string :code
      t.boolean :contra

      t.timestamps
    end
  end
end
