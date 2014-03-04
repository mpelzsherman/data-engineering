class PurchaseFileParser

  def create_purchases(path_to_purchase_file)
    File.readlines(path_to_purchase_file).each_with_index do |line, index|
      next if index == 0
      purchaser_name, item_description, item_price, purchase_count, merchant_address, merchant_name = line.split("\t")
      customer = Customer.where(name: purchaser_name).first_or_create(name: purchaser_name)
      merchant = Merchant.where(name: merchant_name).first_or_create(name: merchant_name, address: merchant_address)
      Purchase.create(customer: customer, merchant: merchant, item_description: item_description, item_price: item_price, purchase_count: purchase_count)
    end

  end

end