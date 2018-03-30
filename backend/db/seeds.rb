# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
include Faker

### 1 ###
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

### 2 ###
Classification.destroy_all

3.times do 
    Classification.create(
        name: Faker::Name.name
    )
end

### 3 ###
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

### 4 ###
Question.destroy_all

10.times do 
    Question.create(
        question: Faker::Lorem.paragraph,
        answer:  Faker::Lorem.paragraph,
        date: Time.now,
        user_id: Faker::Number.between(1, 10),
        article_id: Faker::Number.between(1, 10)
    )
end

### 5 ###
Sale.destroy_all

5.times do 
    Sale.create(
        date: Time.now,
        quantity: Faker::Number.between(1, 10),
        amount: Faker::Number.between(10000, 100000),
        seller_id: Faker::Number.between(1, 10),
        buyer_id: Faker::Number.between(1, 10),
        article_id: Faker::Number.between(1, 10)
    )
end

### 6 ###
Score.destroy_all

5.times do 
    Score.create(
        commentary: Faker::Lorem.paragraph,
        score: Faker::Number.between(1, 10),
        sale_id: Faker::Number.between(1, 10),
        qualified_id: Faker::Number.between(1, 10),
        qualifier_id: Faker::Number.between(1, 10)
    )
end

### 7 ###
#Message.destroy_all
#
#5.times do 
#    Message.create(
#        topic: "Mensaje urgente",
#        content: Faker::Lorem.paragraph,
#        date: Time.now,
#        sender_id: Faker::Number.between(1, 10),
#        receiver_id: Faker::Number.between(1, 10)
#    )
#end

### 8 ###
#Photo.destroy_all
#
#5.times do 
#    Photo.create(
#        photo: "??????",
#        article_id: Faker::Number.between(1, 10)
#    )
#end

### 9 ###
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

