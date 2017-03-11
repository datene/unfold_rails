# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Home.destroy_all
Blog.destroy_all

puts "creating home page model"

Home.create(
  header: "we unlock creativity",
  content: 
  "allowing people to reach their full potential. 
  We are on a mission to change the world of work - 
  using creative principles, 
  building solid team cultures and collecting gifs along the way"
  )

puts "creating blog page model"

Blog.create(
  user: "unless-io"
  )