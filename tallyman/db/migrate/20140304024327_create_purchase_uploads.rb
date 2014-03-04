class CreatePurchaseUploads < ActiveRecord::Migration
  def change
    create_table :purchase_uploads do |t|
      t.string :file

      t.timestamps
    end
  end
end
