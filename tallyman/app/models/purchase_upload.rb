class PurchaseUpload < ActiveRecord::Base
  validates :file, presence: true
  mount_uploader :file, PurchaseFileUploader
  has_many :purchases

  def gross_revenue
    purchases.inject(0){|sum, purchase| sum + (purchase.item_price * purchase.purchase_count) }
  end
end
