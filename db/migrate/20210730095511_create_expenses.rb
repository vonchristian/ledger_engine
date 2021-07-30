class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses, id: :uuid do |t|
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.string :name
      t.string :code
      t.boolean :contra

      t.timestamps
    end

    add_index :expenses, :code
  end
end
