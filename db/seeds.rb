# This file should ctontain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
#User.destroy_all
#City.destroy_all
#Gossip.destroy_all
#Tag.destroy_all

ActiveRecord::Base.connection.execute("TRUNCATE users RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE cities RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE gossips RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE tags RESTART IDENTITY CASCADE")
ActiveRecord::Base.connection.execute("TRUNCATE comments RESTART IDENTITY CASCADE")


10.times do |index|
	City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: Faker::Number.between(from: 1, to: 80), city: City.all.sample)
	Tag.create!(title: Faker::Book.genre)
end

20.times do
	g = Gossip.create!(title: Faker::Lorem.sentence(word_count: 2), content: Faker::Lorem.sentence(word_count: 30), user: User.find(rand(User.first.id..User.last.id)), tags: [Tag.find(rand(Tag.first.id..Tag.last.id)), Tag.find(rand(Tag.first.id..Tag.last.id))])	
	Comment.create!(content: Faker::Lorem.paragraph(sentence_count: 2), user: User.all.sample, gossip: g)
end

User.create!(first_name: 'anonymous', last_name: "anonymous", description: "unknow", email: "unknow", age: 0, city: City.all.sample)
