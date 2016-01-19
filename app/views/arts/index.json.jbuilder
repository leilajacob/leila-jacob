json.array!(@arts) do |art|
  json.extract! art, :id, :name, :price, :quantity, :description, :category_id
  json.url art_url(art, format: :json)
end
