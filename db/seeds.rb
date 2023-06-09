# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "Aragorn", password: "password")
User.create(username: "Frodo", password: "password")
User.create(username: "Gandalf", password: "password")
User.create(username: "Legolas", password: "password")

Message.create(body: "Hi, I'm a new message", user: User.first)
Message.create(body: "Hi, I am Aragorn", user: User.last)
Message.create(body: "I want to go home", user: User.last)
Message.create(body: "You shall not pass", user: User.last)
Message.create(body: "They taking the Hobbits to Isengard", user: User.last)
