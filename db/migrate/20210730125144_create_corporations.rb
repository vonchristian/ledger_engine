class CreateCorporations < ActiveRecord::Migration[6.1]
  def change
    create_table :corporations, id: :uuid do |t|
      t.string :business_name

      t.timestamps
    end
  end
end
