# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

30.times do 
 
  clasificacions.create(
    id :Faker::UniqueGenerator.clear,
    nombre :Faker::Name.first_name,
    padre :Faker::Name.last_name,
  )

  fotos.create(
    id :Faker::UniqueGenerator.clear,
    fecha :Faker::Time,
    foto :Faker::Boolean,
    producto :Faker::String,
  )

  productos.create(
      id :Faker::UniqueGenerator.clear,
      tipoproducto :Faker::String,
      idusuario :Faker::String,
      nombre :Faker::Name.first_name,
      descripcion :Faker::String,
      precio :Faker::Number,
      inventario :Faker::Number,
  )

  calificacions.create(
      id :Faker::UniqueGenerator.clear,
      idcalificador :Faker::UniqueGenerator.clear,
      idcalificado :Faker::UniqueGenerator.clear,
      idventa :Faker::UniqueGenerator.clear,
      comentario :Faker::String,
      prestigio :Faker::Number,
  )

  usuarios.create(
      id :Faker::UniqueGenerator.clear,
      tipousuario :Faker::String,
      identificacion :Faker::Number,
      tipoidentificacion :Faker::Boolean,
      correo :Faker::Internet.email,
      telefono :Faker::PhoneNumber,
      latitud :Faker::Number,
      longitud :Faker::Number,
      contrasena :Faker::Number,
      
  )

  cambiar.mensajes(
      id :Faker::UniqueGenerator.clear,
      idemisor :Faker::UniqueGenerator.clear,
      iddestinatario :Faker::UniqueGenerator.clear,
      asunto :Faker::String,
      contenido :Faker::String,
      fecha :Faker::Time,
      
  )

  alianzas.create(
      id :Faker::UniqueGenerator.clear,
      usuariosolicitante :Faker::UniqueGenerator.clear,
      usuarioconfirma :Faker::UniqueGenerator.clear,
      comentario :Faker::String,
      confirmacion :Faker::Boolean,
      
  )

  cambiar.pedidos(
      id :Faker::UniqueGenerator.clear,
      idproducto :Faker::UniqueGenerator.clear,
      idusuariocomp :Faker::UniqueGenerator.clear,
      idusuariovend :Faker::UniqueGenerator.clear,
      fecha :Faker::Time,
      cantidad :Faker::Number,
      monto :Faker::Number.decimal(2)
      
  )

  interrogantes.create(
      id :Faker::UniqueGenerator.clear,
      idusuario :Faker::UniqueGenerator.clear,
      idproducto :Faker::UniqueGenerator.clear,
      pregunta :Faker::String,
      respuesta :Faker::String,
      fecha :Faker::Time,
      
  )

  
end  
