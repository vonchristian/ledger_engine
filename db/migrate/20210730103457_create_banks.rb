class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks, id: :uuid do |t|
      t.string :bank_name

      t.timestamps
    end
  end
end
