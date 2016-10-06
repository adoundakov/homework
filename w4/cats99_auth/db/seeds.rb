# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(username: 'bob', password: '12')
User.create!(username: 'billy', password: '12')

Cat.create!(name: 'Kitty Gaga', color: 'white', birth_date: '20160101', sex: 'F', description: 'chill', user_id: 1)
Cat.create!(name: 'Chairman Meow', color: 'black', birth_date: '20150101', sex: 'M', description: 'funny', user_id: 1)
Cat.create!(name: 'Kitty Swift', color: 'orange', birth_date: '10100101', sex: 'F', description: 'ancient', user_id: 2)
Cat.create!(name: 'Jefferson', color: 'grey', birth_date: '20010501', sex: 'M', description: 'grey', user_id: 2)
