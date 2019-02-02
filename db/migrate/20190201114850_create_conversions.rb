class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
      t.integer :initial_currency_id
      t.integer :final_currency_id
      t.float :amount
      t.float :result

      t.timestamps
    end
  end
end
