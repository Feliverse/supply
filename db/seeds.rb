# Delete all records from the tables
Sale.delete_all
Inventario.delete_all
Movimiento.delete_all
Articulo.delete_all
Product.delete_all
Tech.delete_all
Calidad.delete_all
Subcategory.delete_all
Category.delete_all
Marca.delete_all
Cliente.delete_all
Almacen.delete_all

# Crear Categorías
ceramica = Category.create(name: 'Cerámica')
porcelanato = Category.create(name: 'Porcelanato')
complementos = Category.create(name: 'Complementos')
accesorios = Category.create(name: 'Accesorios')
sanitarios = Category.create(name: 'Sanitarios')

# Crear Subcategorías
pisos = Subcategory.create(name: 'Pisos', category: ceramica)
revestimientos = Subcategory.create(name: 'Revestimientos', category: ceramica)
pisos_grandes = Subcategory.create(name: 'Pisos grandes', category: porcelanato)
randas = Subcategory.create(name: 'Randas', category: complementos)
apliques = Subcategory.create(name: 'Apliques', category: complementos)
pastinas = Subcategory.create(name: 'Pastinas', category: complementos)
pegamentos = Subcategory.create(name: 'Pegamentos', category: complementos)
grifo = Subcategory.create(name: 'Grifo', category: sanitarios)
llavedepaso = Subcategory.create(name: 'Llave de paso', category: sanitarios)
baterias = Subcategory.create(name: 'Baterías', category: accesorios)
pernos = Subcategory.create(name: 'Pernos', category: accesorios)
kit = Subcategory.create(name: 'Kit de accesorios', category: accesorios)
tapas = Subcategory.create(name: 'Tapa de baño', category: sanitarios)
chicotillos = Subcategory.create(name: 'Chicotillos 0.60', category: accesorios)
juegos = Subcategory.create(name: 'Juegos de baño', category: sanitarios)

# Crear Marcas
coboce = Marca.create(name: 'Coboce')
faboce = Marca.create(name: 'Faboce')
jeiz = Marca.create(name: 'Jeiz')
importado = Marca.create(name: 'Importado')
cremax = Marca.create(name: 'Cremax')
redimix = Marca.create(name: 'Redimix')
fv = Marca.create(name: 'FV')
icasa = Marca.create(name: 'Icasa')
italgrif = Marca.create(name: 'Italgrif')

# Crear Calidades
primera = Calidad.create(name: 'primera')
segunda = Calidad.create(name: 'segunda')
tercera = Calidad.create(name: 'tercera')

# Crear Datos técnicos
tech_41x41 = Tech.create(
  name: '41x41', 
  pieces_box: 12, 
  m2_box: 2, 
  marca_id: coboce.id,
  subcategory_id: pisos.id
)

tech_60x60 = Tech.create(
  name: '60x60',
  pieces_box: 4,
  m2_box: 1.44,
  marca_id: coboce.id,
  subcategory_id: pisos.id
)

# Crear Productos
producto1 = Product.create(
  name: 'Troya',
  tech: tech_41x41,
  calidad: primera,
  tonocalibre: 'A1',
  subcategory_id: pisos.id,
  marca_id: coboce.id
)

# Crear Artículos
articulo1 = Articulo.create(name: 'Pastina blanca', subcategory: pastinas, marca: cremax)
articulo2 = Articulo.create(name: 'Cemento cola', subcategory: pegamentos, marca: redimix)
articulo3 = Articulo.create(name: 'Grifo', subcategory: grifo, marca: fv) 
articulo4 = Articulo.create(name: 'Llave de paso', subcategory: llavedepaso, marca: fv)
articulo5 = Articulo.create(name: 'Batería', subcategory: baterias, marca: fv)
articulo6 = Articulo.create(name: 'Perno', subcategory: pernos, marca: fv)
articulo7 = Articulo.create(name: 'Kit de accesorios', subcategory: kit, marca: fv)
articulo8 = Articulo.create(name: 'Tapa de baño', subcategory: tapas, marca: fv)
articulo9 = Articulo.create(name: 'Chicotillo 0.60 - metalico', subcategory: chicotillos, marca: fv)
articulo10 = Articulo.create(name: 'Chicotillo 0.60 - plastico', subcategory: chicotillos, marca: fv)
articulo11 = Articulo.create(name: 'Juego de baño blanco', subcategory: juegos, marca: icasa)
articulo12 = Articulo.create(name: 'Juego de baño beige', subcategory: juegos, marca: icasa)
articulo13 = Articulo.create(name: 'Juego de baño blanco', subcategory: juegos, marca: italgrif)

# Crear Almacenes
almacen_principal = Almacen.create(name: 'Almacén Principal')
almacen_secundario = Almacen.create(name: 'Almacén Secundario')

# Crear Clientes
cliente1 = Cliente.create(name: 'Juan Perez', nit: '123456789')
cliente2 = Cliente.create(name: 'Maria Lopez', nit: '987654321')

# Registrar movimientos de inventario
almacen_principal.registrar_ingreso(articulo1, 100, 'Ingreso por compra')
almacen_principal.registrar_ingreso(articulo2, 50, 'Ingreso por compra')
almacen_principal.registrar_salida(articulo1, 20, 'Salida por venta')
almacen_principal.registrar_salida(articulo2, 10, 'Salida por ajuste')

# Realizar traspaso entre almacenes
almacen_principal.traspasar(articulo1, 30, almacen_secundario)

# Registrar ventas
almacen_principal.registrar_venta(cliente1, articulo1, 10)
almacen_principal.registrar_venta(cliente2, articulo2, 5)
almacen_secundario.registrar_venta(cliente1, articulo1, 5)

# Create Almacenes
almacen1 = Almacen.create!(name: 'Almacen Central')
almacen2 = Almacen.create!(name: 'Almacen Secundario')

# Create Marcas
marca1 = Marca.create!(name: 'Marca A', logo: 'logo_a.png', contact_name: 'Contacto A', contact_number: '123456789')
marca2 = Marca.create!(name: 'Marca B', logo: 'logo_b.png', contact_name: 'Contacto B', contact_number: '987654321')

# Create Categories and Subcategories
category1 = Category.create!(name: 'Categoria 1')
subcategory1 = category1.subcategories.create!(name: 'Subcategoria 1')
subcategory2 = category1.subcategories.create!(name: 'Subcategoria 2')

# Create Calidads
calidad1 = Calidad.create!(name: 'Calidad Alta')
calidad2 = Calidad.create!(name: 'Calidad Media')

# Create Teches
tech1 = Tech.create!(name: 'Tech 1', pieces_box: 10, m2_box: 1.5, marca: marca1, subcategory: subcategory1)
tech2 = Tech.create!(name: 'Tech 2', pieces_box: 20, m2_box: 2.0, marca: marca2, subcategory: subcategory2)

# Create Products
product1 = Product.create!(name: 'Producto 1', tonocalibre: 'Tono 1', tech: tech1, calidad: calidad1, subcategory_id: subcategory1.id, marca_id: marca1.id)
product2 = Product.create!(name: 'Producto 2', tonocalibre: 'Tono 2', tech: tech2, calidad: calidad2, subcategory_id: subcategory2.id, marca_id: marca2.id)

# Create Articulos
articulo1 = Articulo.create!(name: 'Articulo 1', subcategory: subcategory1, marca: marca1)
articulo2 = Articulo.create!(name: 'Articulo 2', subcategory: subcategory2, marca: marca2)

# Create Inventarios for Almacen 1
Inventario.create!(cantidad_disponible: 100, fecha_actualizacion: Time.now, almacen: almacen1, product: product1)
Inventario.create!(cantidad_disponible: 200, fecha_actualizacion: Time.now, almacen: almacen1, articulo: articulo1)

# Create Inventarios for Almacen 2
Inventario.create!(cantidad_disponible: 150, fecha_actualizacion: Time.now, almacen: almacen2, product: product2)
Inventario.create!(cantidad_disponible: 250, fecha_actualizacion: Time.now, almacen: almacen2, articulo: articulo2)

# Create Clientes
cliente1 = Cliente.create!(name: 'Cliente 1', nit: '1234567890')
cliente2 = Cliente.create!(name: 'Cliente 2', nit: '9876543210')

# Create Sales
Sale.create!(fecha: Time.now, cantidad: 10, cliente_id: cliente1.id, almacen: almacen1, product_id: product1.id, unidad_de_medida: 'pza', precio_unitario: 100.0)
Sale.create!(fecha: Time.now, cantidad: 20, cliente_id: cliente2.id, almacen: almacen2, articulo_id: articulo2.id, unidad_de_medida: 'm2', precio_unitario: 200.0)

# Create a sale where a client buys two articles at once
Sale.create!(
  fecha: Time.now,
  cliente_id: cliente1.id,
  almacen: almacen1,
  cantidades: [5, 10],
  units: ['pza', 'm2'],
  descriptions: [articulo1.id, articulo2.id],
  unit_prices: [50.0, 150.0],
)