json.extract! articulo, :id, :name, :subcategory_id, :marca_id, :created_at, :updated_at
json.url articulo_url(articulo, format: :json)
