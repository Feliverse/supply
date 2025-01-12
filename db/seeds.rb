# Crear Categorías
ceramica = Category.create(name: 'Cerámica')
porcelanato = Category.create(name: 'Porcelanato')
complementos = Category.create(name: 'Complementos')

# Crear Subcategorías
pisos = Subcategory.create(name: 'Pisos', category: ceramica)
revestimientos = Subcategory.create(name: 'Revestimientos', category: ceramica)
pisos_grandes = Subcategory.create(name: 'Pisos grandes', category: porcelanato)
randas = Subcategory.create(name: 'Randas', category: complementos)
apliques = Subcategory.create(name: 'Apliques', category: complementos) 

# Crear Marcas
coboce = Marca.create(name: 'Coboce')
faboce = Marca.create(name: 'Faboce')
jeiz = Marca.create(name: 'Jeiz')
importado = Marca.create(name: 'Importado')

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

tech_30x45 = Tech.create(
  name: '30x45',
  pieces_box: 12,
  m2_box: 1.62,
  marca_id: coboce.id,
  subcategory_id: revestimientos.id
)

tech_42x42 = Tech.create(
  name: '42x42',
  pieces_box: 10,
  m2_box: 1.77,
  marca_id: faboce.id,
  subcategory_id: pisos.id
)

tech_45x45 = Tech.create(
  name: '45x45',
  pieces_box: 9,
  m2_box: 1.85,
  marca_id: faboce.id,
  subcategory_id: pisos.id
)

tech_50x50 = Tech.create(
  name: '50x50',
  pieces_box: 8,
  m2_box: 1.85,
  marca_id: faboce.id,
  subcategory_id: pisos.id
)

tech_61x61 = Tech.create(
  name: '61x61',
  pieces_box: 4,
  m2_box: 1.49,
  marca_id: faboce.id,
  subcategory_id: pisos.id
)

tech_30x40 = Tech.create(
  name: '30x40',
  pieces_box: 15,
  m2_box: 1.83,
  marca_id: faboce.id,
  subcategory_id: revestimientos.id
)

tech_43x43 = Tech.create(
  name: '43x43',
  pieces_box: 12,
  m2_box: 1.5,
  marca_id: jeiz.id,
  subcategory_id: pisos.id
)

tech_60x60i = Tech.create(
  name: '60x60importado',
  pieces_box: 4,
  m2_box: 1.44,
  marca_id: importado.id,
  subcategory_id: pisos_grandes.id
)

randa_10x60 = Tech.create(
  name: '10x60',
  pieces_box: 20,
  m2_box: 0,
  marca_id: importado.id,
  subcategory_id: randas.id 
)

randa_08x025 = Tech.create(
  name: '08x025',
  pieces_box: 20,
  m2_box: 0, 
  marca_id: importado.id,
  subcategory_id: randas.id 
)

aplique_30x45 = Tech.create(
  name: '30x45 aplique',
  pieces_box: 2,
  m2_box: 0.27,
  marca_id: coboce.id,
  subcategory_id: apliques.id
)

# Crear Productos
producto1 = Product.create(
  name: 'Troya',
  tech_id: tech_41x41.id,
  calidad_id: primera.id,
  tonocalibre: 'A1'
)

# Crear Inventario
#Inventario.create(producto: producto1, cantidad_disponible: 100, fecha_actualizacion: Time.now)
#Inventario.create(producto: producto2, cantidad_disponible: 50, fecha_actualizacion: Time.now)

# Crear Movimientos
#Movimiento.create(producto: producto1, tipo_movimiento: 'Ingreso', cantidad: 20, fecha_movimiento: Time.now)
#Movimiento.create(producto: producto1, tipo_movimiento: 'Egreso', cantidad: 10, fecha_movimiento: Time.now)
#Movimiento.create(producto: producto2, tipo_movimiento: 'Ingreso', cantidad: 30, fecha_movimiento: Time.now)
#Movimiento.create(producto: producto2, tipo_movimiento: 'Egreso', cantidad: 5, fecha_movimiento: Time.now)
