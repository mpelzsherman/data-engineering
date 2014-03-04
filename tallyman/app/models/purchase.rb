class Purchase < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  belongs_to :purchase_upload
end
