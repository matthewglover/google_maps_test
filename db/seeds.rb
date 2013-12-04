# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.find_or_create_by(factual_id: "1a19fc48-25dc-4dde-8abe-fd4c97bfdec2") do |place|
  place.name = "Venus Steak House"
  place.address = "368 Bethnal Green Rd"
  place.region = "London"
  place.country = "gb"
  place.postcode = "E2 0AH"
  place.lat = 51.526588
  place.lng = -0.062188
end

Place.find_or_create_by(factual_id: "1b6227a6-5cbb-4167-82a5-70a5632c3b07") do |place|
  place.name = "Nando's"
  place.address = "366 Bethnal Green Rd"
  place.region = "London"
  place.country = "gb"
  place.postcode = "E2 0AH"
  place.lat = 51.526768
  place.lng = -0.062116
  place.telephone = "020 7729 5783"
end

Place.find_or_create_by(factual_id: "3a198c9f-f0c8-4223-a7e2-8f87928bc6fe") do |place|
  place.name = "Les Trois Garcons"
  place.address = "1 Club Row"
  place.region = "London"
  place.country = "gb"
  place.postcode = "E1 6JX"
  place.lat = 51.523991
  place.lng = -0.074158
  place.telephone = "020 7613 1924"
end

# Place.find_or_create_by(factual_id: ) do |place|
#   place.name = ""
#   place.address = ""
#   place.region = ""
#   place.country = "gb"
#   place.postcode = ""
#   place.lat = 
#   place.lng = 
#   place.telephone = ""
# end
