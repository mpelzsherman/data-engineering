json.array!(@purchases) do |purchase|
  json.extract! purchase, :customer_id, :item_description, :item_price, :purchase_count, :merchant_id
  json.url purchase_url(purchase, format: :json)
end