# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Crear Categorías
pisos = Category.create(name: 'Pisos')
revestimientos = Category.create(name: 'Revestimientos')

# Crear Subcategorías
ceramicos = Subcategory.create(name: 'Cerámicos', category: pisos)
porcelanatos = Subcategory.create(name: 'Porcelanatos', category: pisos)
gres = Subcategory.create(name: 'Gres', category: pisos)

# Crear Marcas
marca1 = Marca.create(name: 'Coboce')
marca2 = Marca.create(name: 'Faboce')

# Crear Datos técnicos
41x41 = Tech.create(
  format: '41x41', 
  pieces_box: 12, 
  m2_box: 2, 
  tomo_calibre: 'A1', 
  lote: '', 
  color: '', 
  marca: marca1)

60x60 = Tech.create(
  format: '60x60', 
  pieces_box: 4, 
  m2_box: 1.44, 
  tomo_calibre: 'A1', 
  lote: '', 
  color: '', 
  marca: marca1)

# Crear Productos
producto1 = Producto.create(
  nombre: 'Troya',
  subcategoria: ceramicos,
  marca: marca1,
  tech: 41x41
)

producto2 = Producto.create(
  nombre: 'Producto 2',
  subcategoria: porcelanatos,
  marca: marca2,
  Tech: 60x60
)

# Crear Inventario
#Inventario.create(producto: producto1, cantidad_disponible: 100, fecha_actualizacion: Time.now)
#Inventario.create(producto: producto2, cantidad_disponible: 50, fecha_actualizacion: Time.now)

# Crear Movimientos
#Movimiento.create(producto: producto1, tipo_movimiento: 'Ingreso', cantidad: 20, fecha_movimiento: Time.now)
#Movimiento.create(producto: producto1, tipo_movimiento: 'Egreso', cantidad: 10, fecha_movimiento: Time.now)
#Movimiento.create(producto: producto2, tipo_movimiento: 'Ingreso', cantidad: 30, fecha_movimiento: Time.now)
#Movimiento.create(producto: producto2, tipo_movimiento: 'Egreso', cantidad: 5, fecha_movimiento: Time.now)
