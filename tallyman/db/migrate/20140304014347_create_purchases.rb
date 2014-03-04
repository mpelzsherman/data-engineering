class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :customer_id
      t.string :item_description
      t.float :item_price
      t.integer :purchase_count
      t.integer :merchant_id

      t.timestamps
    end
  end
end
