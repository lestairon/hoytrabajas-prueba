class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :nit
      t.string :contact_name
      t.string :contact_number

      t.timestamps
    end
  end
end
