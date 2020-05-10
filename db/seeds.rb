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
ActiveRecord::Base.connection.execute("TRUNCATE gossips_tags RESTART IDENTITY CASCADE")



10.times do |index|
	City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
	User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 10), email: Faker::Internet.email, age: Faker::Number.between(from: 1, to: 80), city: City.all.sample, password: 'eingerziogn')
	Tag.create!(title: Faker::Book.genre)
end

20.times do
	
	Gossip.create!(title: Faker::Book.title, content: Faker::ChuckNorris.fact, user: User.all.sample, tags: Tag.all.sample(rand(1..4)))	
end

30.times do
	Comment.create!(content: Faker::Movie.quote, user: User.all.sample, gossip: Gossip.all.sample)
end