json.array!(@ordered_products) do |ordered_product|
  json.extract! ordered_product, :id, :quantity, :product_id, :cart_id, :price_per_unit
  json.url ordered_product_url(ordered_product, format: :json)
end
