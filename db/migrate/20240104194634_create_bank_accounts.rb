class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.references :bank, null: false, foreign_key: true
      t.references :provider, null: false, foreign_key: true
      t.string :number, null: false, default: 0, limit: 15

      t.timestamps
    end
  end
end
