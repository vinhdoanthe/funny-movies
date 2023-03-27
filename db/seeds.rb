# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u = User.find_by(username: "admin")
if u.nil?
  u = User.create(username: "admin", password: "admin")
end

Movie.create(user: u, link: "https://www.youtube.com/watch?v=QH2-TGUlwu4")
