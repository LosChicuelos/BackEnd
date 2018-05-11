# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
include Faker

def chooseTypeUser()
  typeuser = ''
  number = rand(8)+1
  case number
  when 1
	typeuser = 'ADMINISTRADOR'
  when 2,3,4,5
  	typeuser = 'COMPRADOR'
  else
  	typeuser = 'VENDEDOR'
  end
end

def confirm()
  confirm = ''
  number = rand(2)+1
  case number
  when 1
	confirm = 'NO'
  else
  	confirm = 'SI'
  end
end

Alliance.destroy_all
Photo.destroy_all
Message.destroy_all
Score.destroy_all
Sale.destroy_all
Question.destroy_all
Article.destroy_all
Classification.destroy_all
User.destroy_all

Classification.connection.execute('UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME="classifications"')
Article.connection.execute('UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME="articles"')
Sale.connection.execute('UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME="sales"')
User.connection.execute('UPDATE SQLITE_SEQUENCE SET SEQ=0 WHERE NAME="users"')

User.create(
    name: "Cristian Felipe", 
    lastname: "Ramos Lopez",
    typeuser: 'ADMINISTRADOR',
    iddocument: "1085265243",
    typedocument: "CC",
    email: "cframosl@unal.edu.co",
    phone: "3112872572",
    latitude: Faker::Number.between(4.5091, 4.8091),
    langitude: Faker::Number.between(-74.077, -74.377),
    password: "00000000"
)

10.times do 
    User.create(
        name: Faker::Name.name,
        lastname: Faker::Name.last_name,
        typeuser: chooseTypeUser(),
        iddocument: Faker::Code.imei,
        typedocument: "CC",
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.phone_number,
        latitude: Faker::Number.between(4.5091, 4.8091),
        langitude: Faker::Number.between(-74.077, -74.377),
        password: Faker::Internet.password(8)
    )
end


3.times do 
    Classification.create(
        name: Faker::Name.name
    )
end

100.times do 
    Article.create(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        price: Faker::Number.decimal(4, 2),
        inventory: Faker::Number.number(4),
        user_id: Faker::Number.between(1, 10),
        classification_id: Number.between(1, 3),
        created_at: Faker::Date.between(1.year.ago, Date.today)
    )
end

20.times do 
    Question.create(
        question: Faker::Lorem.paragraph,
        answer:  Faker::Lorem.paragraph,
        date: Time.now,
        user_id: Faker::Number.between(1, 10),
        article_id: Faker::Number.between(1, 10)
    )
end

20.times do 
    Alliance.create(
        commentary: Faker::Lorem.paragraph,
        confirm: confirm(),
        approval_id: Faker::Number.between(1, 11),
        applicant_id: Faker::Number.between(1, 11)
    )
end

30.times do 
    Message.create(
        topic: "Mensaje urgente",
        content: Faker::Lorem.paragraph,
        date: Time.now,
        sender_id: Faker::Number.between(1, 10),
        receiver_id: Faker::Number.between(1, 10)
    )
end

30.times do 
    Sale.create(
        date: Time.now,
        created_at: Faker::Date.between(1.year.ago, Date.today),
        quantity: Number.between(1, 10),
        amount: Faker::Number.between(10000, 100000),
        seller_id: Faker::Number.between(1, 10),
        buyer_id: Faker::Number.between(1, 10),
        article_id: Faker::Number.between(1, 10)
    )
end

30.times do 
    Score.create(
        commentary: Faker::Lorem.paragraph,
        score: Faker::Number.between(0, 5),
        sale_id: Faker::Number.between(1, 30),
        qualified_id: Faker::Number.between(1, 10),
        qualifier_id: Faker::Number.between(1, 10)
    )
end

=begin
puts "User " + User.count.to_s
puts "Classification " + Classification.count.to_s
puts "Article " + Article.count.to_s
puts "Question " + Question.count.to_s
puts "Alliance " + Alliance.count.to_s
puts "Message " + Message.count.to_s
puts "Sale " + Sale.count.to_s
puts "Score " + Score.count.to_s
puts "Photo " + Photo.count.to_s


5.times do 
    Photo.create(
        photo: "??????",
        article_id: Faker::Number.between(1, 10)
    )
end
=end