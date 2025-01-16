json.extract! inventario, :id, :cantidad_disponible, :fecha_actualizacion, :almacen_id, :product_id, :articulo_id, :created_at, :updated_at
json.url inventario_url(inventario, format: :json)
