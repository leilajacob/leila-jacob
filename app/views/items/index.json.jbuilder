json.array!(@items) do |item|
  json.extract! item, :id, :product_id, :quantity, :line_item_total, :order_id
  json.url item_url(item, format: :json)
end
