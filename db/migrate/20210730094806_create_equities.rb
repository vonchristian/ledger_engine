class CreateEquities < ActiveRecord::Migration[6.1]
  def change
    create_table :equities, id: :uuid do |t|
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.string :name
      t.string :code
      t.boolean :contra

      t.timestamps
    end

    add_index :equities, :code
  end
end
