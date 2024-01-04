class CreateBanks < ActiveRecord::Migration[6.1]
  def change
    create_table :banks do |t|
      t.string :name, nil: false, limit: 50

      t.timestamps
    end
  end
end
