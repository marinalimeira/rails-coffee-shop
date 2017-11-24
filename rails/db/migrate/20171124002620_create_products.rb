class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :weight
      t.string :roast
      t.string :ground
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
