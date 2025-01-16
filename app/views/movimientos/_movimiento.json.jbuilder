json.extract! movimiento, :id, :almacen_id, :product_id, :articulo_id, :tipo, :cantidad, :fecha, :created_at, :updated_at
json.url movimiento_url(movimiento, format: :json)
