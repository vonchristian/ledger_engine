class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets, id: :uuid do |t|
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.string :name
      t.string :code
      t.boolean :contra, default: false

      t.timestamps
    end

    add_index :assets, :code
  end
end
