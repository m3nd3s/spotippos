# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

provinces = JSON.parse(File.read(Rails.root.join('db', 'provinces.json')))
provinces.each do |name, attributes|
  boundaries = attributes["boundaries"]
  Province.create({
    name: name,
    ax: boundaries["upperLeft"]["x"],
    ay: boundaries["upperLeft"]["y"],
    bx: boundaries["bottomRight"]["x"],
    by: boundaries["bottomRight"]["y"]
  })
end

properties = JSON.parse(File.read(Rails.root.join('db', 'properties.json')))["properties"]
Property.create(properties)
