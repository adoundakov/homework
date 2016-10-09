# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

6.times do
  User.create(username: Faker::StarWars.character, password: Faker::Internet.password(6))
end
User.create(username: "joey", password: "password")

10.times do
  Sub.create(title: Faker::Hipster.word, moderator_id: (rand(6) + 1), description: Faker::Pokemon.name)
end

100.times do
  Post.create(title: Faker::Hacker.ingverb, url: Faker::Internet.url, content: Faker::Hipster.paragraph, author_id: (rand(6) + 1))
end

(1..100).each do |i|
  Postsub.create(post_id: i, sub_id: rand(9) + 1 )
end

1000.times do
  Comment.create(content: Faker::ChuckNorris.fact, post_id: (rand(99) + 1), author_id: (rand(6) + 1))
end
