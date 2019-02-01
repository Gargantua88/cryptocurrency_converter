class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
      t.string :initial_currency
      t.string :final_currency
      t.float :amount
      t.float :result

      t.timestamps
    end
  end
end
