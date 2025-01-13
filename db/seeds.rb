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
  tonocalibre: 'A1'
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

# Registrar movimientos de inventario
almacen_principal.registrar_ingreso(articulo1, 100, 'Ingreso por compra')
almacen_principal.registrar_ingreso(articulo2, 50, 'Ingreso por compra')
almacen_principal.registrar_salida(articulo1, 20, 'Salida por venta')
almacen_principal.registrar_salida(articulo2, 10, 'Salida por ajuste')

# Realizar traspaso entre almacenes
almacen_principal.traspasar(articulo1, 30, almacen_secundario)

# # Crear Categorías
# ceramica = Category.create(name: 'Cerámica')
# porcelanato = Category.create(name: 'Porcelanato')
# complementos = Category.create(name: 'Complementos')

# # Crear Subcategorías
# pisos = Subcategory.create(name: 'Pisos', category: ceramica)
# revestimientos = Subcategory.create(name: 'Revestimientos', category: ceramica)
# pisos_grandes = Subcategory.create(name: 'Pisos grandes', category: porcelanato)
# randas = Subcategory.create(name: 'Randas', category: complementos)
# apliques = Subcategory.create(name: 'Apliques', category: complementos) 

# # Crear Marcas
# coboce = Marca.create(name: 'Coboce')
# faboce = Marca.create(name: 'Faboce')
# jeiz = Marca.create(name: 'Jeiz')
# importado = Marca.create(name: 'Importado')

# # Crear Calidades
# primera = Calidad.create(name: 'primera')
# segunda = Calidad.create(name: 'segunda')
# tercera = Calidad.create(name: 'tercera')

# # Crear Datos técnicos
# tech_41x41 = Tech.create(
#   name: '41x41', 
#   pieces_box: 12, 
#   m2_box: 2, 
#   marca_id: coboce.id,
#   subcategory_id: pisos.id
# )

# tech_60x60 = Tech.create(
#   name: '60x60',
#   pieces_box: 4,
#   m2_box: 1.44,
#   marca_id: coboce.id,
#   subcategory_id: pisos.id
# )

# tech_30x45 = Tech.create(
#   name: '30x45',
#   pieces_box: 12,
#   m2_box: 1.62,
#   marca_id: coboce.id,
#   subcategory_id: revestimientos.id
# )

# tech_42x42 = Tech.create(
#   name: '42x42',
#   pieces_box: 10,
#   m2_box: 1.77,
#   marca_id: faboce.id,
#   subcategory_id: pisos.id
# )

# tech_45x45 = Tech.create(
#   name: '45x45',
#   pieces_box: 9,
#   m2_box: 1.85,
#   marca_id: faboce.id,
#   subcategory_id: pisos.id
# )

# tech_50x50 = Tech.create(
#   name: '50x50',
#   pieces_box: 8,
#   m2_box: 1.85,
#   marca_id: faboce.id,
#   subcategory_id: pisos.id
# )

# tech_61x61 = Tech.create(
#   name: '61x61',
#   pieces_box: 4,
#   m2_box: 1.49,
#   marca_id: faboce.id,
#   subcategory_id: pisos.id
# )

# tech_30x40 = Tech.create(
#   name: '30x40',
#   pieces_box: 15,
#   m2_box: 1.83,
#   marca_id: faboce.id,
#   subcategory_id: revestimientos.id
# )

# tech_43x43 = Tech.create(
#   name: '43x43',
#   pieces_box: 12,
#   m2_box: 1.5,
#   marca_id: jeiz.id,
#   subcategory_id: pisos.id
# )

# tech_60x60i = Tech.create(
#   name: '60x60importado',
#   pieces_box: 4,
#   m2_box: 1.44,
#   marca_id: importado.id,
#   subcategory_id: pisos_grandes.id
# )

# randa_10x60 = Tech.create(
#   name: '10x60',
#   pieces_box: 20,
#   m2_box: 0,
#   marca_id: importado.id,
#   subcategory_id: randas.id 
# )

# randa_08x025 = Tech.create(
#   name: '08x025',
#   pieces_box: 20,
#   m2_box: 0, 
#   marca_id: importado.id,
#   subcategory_id: randas.id 
# )

# aplique_30x45 = Tech.create(
#   name: '30x45 aplique',
#   pieces_box: 2,
#   m2_box: 0.27,
#   marca_id: coboce.id,
#   subcategory_id: apliques.id
# )

# # Crear Productos
# producto1 = Product.create(
#   name: 'Troya',
#   tech_id: tech_41x41.id,
#   calidad_id: primera.id,
#   tonocalibre: 'A1'
# )

# # Crear Inventario
# #Inventario.create(producto: producto1, cantidad_disponible: 100, fecha_actualizacion: Time.now)
# #Inventario.create(producto: producto2, cantidad_disponible: 50, fecha_actualizacion: Time.now)

# # Crear Movimientos
# #Movimiento.create(producto: producto1, tipo_movimiento: 'Ingreso', cantidad: 20, fecha_movimiento: Time.now)
# #Movimiento.create(producto: producto1, tipo_movimiento: 'Egreso', cantidad: 10, fecha_movimiento: Time.now)
# #Movimiento.create(producto: producto2, tipo_movimiento: 'Ingreso', cantidad: 30, fecha_movimiento: Time.now)
# #Movimiento.create(producto: producto2, tipo_movimiento: 'Egreso', cantidad: 5, fecha_movimiento: Time.now)

# # Crear Categorías
# materiales = Category.create(name: 'Materiales de construcción')
# griferia = Category.create(name: 'Grifería')
# accesorios = Category.create(name: 'Accesorios para baño')
# sanitarios = Category.create(name: 'Sanitarios')


# # Crear Subcategorías
# pastinas = Subcategory.create(name: 'Pastinas', category: materiales)
# pegamentos = Subcategory.create(name: 'Cemento cola', category: materiales)
# grifo = Subcategory.create(name: 'Grifos', category: griferia)
# llavedepaso = Subcategory.create(name: 'Llaves de paso', category: griferia) 
# baterias = Subcategory.create(name: 'Baterías', category: accesorios)
# pernos = Subcategory.create(name: 'Pernos', category: accesorios)
# kit = Subcategory.create(name: 'Kit de accesorios', category: accesorios)
# tapas = Subcategory.create(name: 'Tapas de baño', category: accesorios)
# chicotillos = Subcategory.create(name: 'Chicotillos 0.60', category: accesorios)
# juegos = Subcategory.create(name: 'Juegos de baño', category: sanitarios)

# # Crear Marcas
# cremax = Marca.create(name: 'Cremax')
# redimix = Marca.create(name: 'Redimix')
# fv = Marca.create(name: 'FV')
# icasa = Marca.create(name: 'Icasa')
# italgrif = Marca.create(name: 'Italgrif')

# # Crear Articulos

# articulo1 = Articulo.create(name: 'Pastina blanca', subcategory_id: pastinas.id, marca_id: cremax.id)
# articulo2 = Articulo.create(name: 'Cemento cola', subcategory_id: pegamentos.id, marca_id: redimix.id)
# articulo3 = Articulo.create(name: 'Grifo', subcategory_id: grifo.id, marca_id: fv.id) 
# articulo4 = Articulo.create(name: 'Llave de paso', subcategory_id: llavedepaso.id, marca_id: fv.id)
# articulo5 = Articulo.create(name: 'Batería', subcategory_id: baterias.id, marca_id: fv.id) # Added marca_id
# articulo6 = Articulo.create(name: 'Perno', subcategory_id: pernos.id, marca_id: fv.id) # Added marca_id
# articulo7 = Articulo.create(name: 'Kit de accesorios', subcategory_id: kit.id, marca_id: fv.id) # Added marca_id
# articulo8 = Articulo.create(name: 'Tapa de baño', subcategory_id: tapas.id, marca_id: fv.id) # Added marca_id
# articulo9 = Articulo.create(name: 'Chicotillo 0.60 - metalico', subcategory_id: chicotillos.id, marca_id: fv.id) # Added marca_id
# articulo10 = Articulo.create(name: 'Chicotillo 0.60 - plastico', subcategory_id: chicotillos.id, marca_id: fv.id) # Added marca_id
# articulo11 = Articulo.create(name: 'Juego de baño blanco', subcategory_id: juegos.id, marca_id: icasa.id)
# articulo12 = Articulo.create(name: 'Juego de baño beige', subcategory_id: juegos.id, marca_id: icasa.id)
# articulo13 = Articulo.create(name: 'Juego de baño blanco', subcategory_id: juegos.id, marca_id: italgrif.id)

# # Crear Almacenes
# almacen_principal = Almacen.create(name: 'Almacén Principal')

# # Registrar movimientos de inventario
# almacen_principal.registrar_ingreso(articulo1, 100, 'Ingreso por compra')
# almacen_principal.registrar_ingreso(articulo2, 50, 'Ingreso por compra')
# almacen_principal.registrar_salida(articulo1, 20, 'Salida por venta')
# almacen_principal.registrar_salida(articulo2, 10, 'Salida por ajuste')
# almacen_principal.registrar_ingreso(producto1, 100, 'Ingreso por compra')