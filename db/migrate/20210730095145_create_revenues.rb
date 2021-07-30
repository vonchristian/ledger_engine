class CreateRevenues < ActiveRecord::Migration[6.1]
  def change
    create_table :revenues, id: :uuid do |t|
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.string :name
      t.string :code
      t.boolean :contra

      t.timestamps
    end

    add_index :revenues, :code
  end
end
