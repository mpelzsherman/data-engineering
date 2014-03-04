class PurchaseUpload < ActiveRecord::Base
  validates :file, presence: true
  mount_uploader :file, PurchaseFileUploader
end
