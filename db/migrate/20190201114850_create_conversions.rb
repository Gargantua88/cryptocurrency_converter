class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
      t.integer :initial_currency
      t.integer :final_currency
      t.float :amount
      t.float :result

      t.timestamps
    end
  end
end
