class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :product_id
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
