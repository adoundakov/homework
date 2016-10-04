# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: '20160310', name: 'Alex', sex: 'M', description: 'chill', color: 'white')
Cat.create!(birth_date: '20020130', name: 'Bob', sex: 'F', description: 'angry', color: 'orange')
Cat.create!(birth_date: '19500610', name: 'Charles', sex: 'F', description: 'old', color: 'black')
Cat.create!(birth_date: '20040815', name: 'Dave', sex: 'M', description: 'ornery', color: 'blue')
Cat.create!(birth_date: '20060916', name: 'JC', sex: 'M', description: 'cool', color: 'purple')

CatRentalRequest.create!(cat_id: 1, start_date: '20050903', end_date: '20161001')
CatRentalRequest.create!(cat_id: 2, start_date: '20030704', end_date: '20040101', status: 'APPROVED')
CatRentalRequest.create!(cat_id: 2, start_date: '20050301', end_date: '20060101', status: 'APPROVED')
CatRentalRequest.create!(cat_id: 5, start_date: '20160105', end_date: '20160610')
