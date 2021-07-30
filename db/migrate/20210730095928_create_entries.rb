class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries, id: :uuid do |t|
      t.date :entry_date
      t.time :entry_time
      t.string :description
      t.string :reference_number
      t.references :institution, polymorphic: true, null: false, type: :uuid
      t.string :recording_type

      t.timestamps
    end

    add_index :entries, :recording_type
    add_index :entries, :entry_date
    add_index :entries, :entry_time
  end
end
