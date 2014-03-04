class AddPurchaseUploadToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :purchase_upload_id, :integer
  end
end
