# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times { User.create!(email: Faker::Internet.safe_email, password: Faker::Internet.password(6, 10), activated: true) }

20.times do
  Band.create!(name: Faker::Book.author)
end

30.times do
  band_id = rand(20) + 1
  genre = Album::Genres.sample
  production_type = ['live', 'studio'].sample
  p "making albums with band id #{band_id}"
  Album.create!(title: Faker::Book.title, band_id: band_id, genre: genre, production_type: production_type)
end

75.times do
  album_id = rand(30) + 1
  type = ['bonus', 'regular'].sample
  title = Faker::Book.title
  lyrics = Faker::Lorem.sentences.join("\n")
  p "making tracks with album_id #{album_id}"
  Track.create!(track_type: type, album_id: album_id, title: title, lyrics: lyrics)
end

250.times do
  t_id = rand(75) + 1
  body = Faker::Lorem.sentence(3)
  u_id = rand(100) + 1
  p "making notes with tid #{t_id} and uid #{u_id}"
  Note.create!(track_id: t_id, user_id: u_id, body: body)
end

User.create!(email: 'alex', password: '123456', admin: true, activated: true)
User.create!(email: 'bob', password: '123456', activated: true)
