# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
include Faker

#10.times do 
#    Classification.create(
#        name: Faker::Name.name
#    )
#end
User.destroy_all

5.times do 
    User.create(
        name: Faker::Name.name,
        lastname: Faker::Name.last_name,
        typeuser: "comprador",
        iddocument: Faker::Code.imei,
        typedocument: "CC",
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        latitude: Faker::Number.decimal(2, 3),
        langitude: Faker::Number.decimal(2, 3),
        password: Faker::Internet.password(8)
    )
end

5.times do 
    User.create(
        name: Faker::Name.name,
        lastname: Faker::Name.last_name,
        typeuser: "vendedor",
        iddocument: Faker::Code.imei,
        typedocument: "CC",
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        latitude: Faker::Number.decimal(2, 3),
        langitude: Faker::Number.decimal(2, 3),
        password: Faker::Internet.password(8)
    )
end

2.times do 
    User.create(
        name: Faker::Name.name,
        lastname: Faker::Name.last_name,
        typeuser: "administrador",
        iddocument: Faker::Code.imei,
        typedocument: "CC",
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        latitude: Faker::Number.decimal(2, 3),
        langitude: Faker::Number.decimal(2, 3),
        password: Faker::Internet.password(8)
    )
end

Classification.destroy_all

3.times do 
    Classification.create(
        name: Faker::Name.name
    )
end

Article.destroy_all

10.times do 
    Article.create(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        price: Faker::Number.decimal(6, 3),
        inventory: Faker::Number.number(4),
        user_id: Faker::Number.between(1, 10),
        classification_id: Number.between(1, 3)
    )
end



#Alliance.destroy_all
#
#10.times do 
#    Alliance.create(
#        commentary: Faker::Lorem.paragraph,
#        confirm: Faker::String.random(2),
#        approval_id: Faker::Number.number(10),
#        applicant_id: Faker::Number.number(10)
#    )
#end

