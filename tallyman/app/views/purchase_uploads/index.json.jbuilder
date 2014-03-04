json.array!(@purchase_uploads) do |purchase_upload|
  json.extract! purchase_upload, :file
  json.url purchase_upload_url(purchase_upload, format: :json)
end