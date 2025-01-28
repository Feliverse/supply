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
  marca: coboce,
  subcategory: pisos
)

tech_60x60 = Tech.create(
  name: '60x60',
  pieces_box: 4,
  m2_box: 1.44,
  marca: coboce,
  subcategory: pisos
)

tech_30x45 = Tech.create(
  name: '30x45',
  pieces_box: 12,
  m2_box: 1.62,
  marca: coboce,
  subcategory: revestimientos
)
tech_42x42 = Tech.create(
  name: '42x42',
  pieces_box: 10,
  m2_box: 1.77,
  marca: faboce,
  subcategory: pisos
)
tech_45x45 = Tech.create(
  name: '45x45',
  pieces_box: 9,
  m2_box: 1.85,
  marca: faboce,
  subcategory: pisos
)
tech_50x50 = Tech.create(
  name: '50x50',
  pieces_box: 8,
  m2_box: 1.85,
  marca: faboce,
  subcategory: pisos
)
tech_61x61 = Tech.create(
  name: '61x61',
  pieces_box: 4,
  m2_box: 1.49,
  marca: faboce,
  subcategory: pisos
)

tech_30x40 = Tech.create(
  name: '30x40',
  pieces_box: 15,
  m2_box: 1.83,
  marca: faboce,
  subcategory: pisos
)
tech_43x43 = Tech.create(
  name: '43x43',
  pieces_box: 12,
  m2_box: 1.5,
  marca: jeiz,
  subcategory: pisos
)

# Ensure pieces_box is defined before it is used
pieces_box = 10 # or any appropriate value

tech_10x30 = Tech.create(
  name: '10x30',
  pieces_box: pieces_box,
  m2_box: 1,
  marca: importado,
  subcategory: randas
)
tech_08x025 = Tech.create(
  name: '08x025',
  pieces_box: pieces_box,
  m2_box: 1,
  marca: importado,
  subcategory: randas
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

producto2 = Product.create(
  name: 'Venecia',
  tech: tech_30x45,
  calidad: primera,
  tonocalibre: 'A2',
  subcategory_id: revestimientos.id,
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
almacen_secundario.registrar_ingreso(producto1, 150, 'Ingreso por compra')
almacen_secundario.registrar_ingreso(producto2, 200, 'Ingreso por compra')

# Realizar traspaso entre almacenes
almacen_principal.traspasar(articulo1, 30, almacen_secundario)
almacen_secundario.traspasar(producto1, 50, almacen_principal)

# Create a sale with multiple products and articles
Sale.create!(
  fecha: Time.now,
  cliente: cliente1,
  almacen: almacen_principal,
  sale_items_attributes: [
    { product_id: producto1.id, cantidad: 5, unidad_de_medida: 'pza', precio_unitario: 50.0 },
    { articulo_id: articulo2.id, cantidad: 10, unidad_de_medida: 'm2', precio_unitario: 150.0 }
  ]
)
