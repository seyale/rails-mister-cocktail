# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
user = JSON.parse(user_serialized)

puts '🌬 Cleaning Ingredients database...'
Ingredient.destroy_all

puts '🧙🏻‍♂️ Creating ingredients...'
ingredients_attributes = []

user['drinks'].each do |ingredient|
  ingredients_attributes << { name: ingredient['strIngredient1'] }
end
Ingredient.create!(ingredients_attributes)
puts '👍🏻 Finished!'
