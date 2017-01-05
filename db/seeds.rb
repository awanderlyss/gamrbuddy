# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Setting path to the rails current environment file
path = Rails.root.join('db', 'seeds', "#{Rails.env}.rb")
# Loading the file if it exists
load path if File.exist?(path)
