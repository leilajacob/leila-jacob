json.array!(@resources) do |resource|
  json.extract! resource, :id, :product_id, :quantity, :line_item_total, :order_id
  json.url resource_url(resource, format: :json)
end
