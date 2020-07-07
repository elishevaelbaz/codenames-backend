require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Word.destroy_all
Game.destroy_all
GameWord.destroy_all

100.times do 
    Word.create(name: Faker::Creature::Animal.name)
end

g1 = Game.create(room_code: "ABCD")

gw1 = GameWord.create(game_id: 1, word_id: 1, category: "red", guessed: false)