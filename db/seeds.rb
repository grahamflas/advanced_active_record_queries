# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
east = Region.create(name: "East")
west = Region.create(name: "West")
central_europe = Region.create(name: "Central Europe")

boston = Location.create(name: "Boston", region: east)
new_york = Location.create(name: "New York", region: east)
denver = Location.create(name: "Denver", region: west)
berlin = Location.create(name: "Berlin", region: central_europe)

developer = Role.create(
  name: "Developer",
  billable: true,
)

manager = Role.create(
  name: "Manager",
  billable: false,
)

Person.create(
  name: "Wendell",
  role: developer,
  location: boston,
)
Person.create(
  name: "Christie",
  role: developer,
  location: boston,
)
Person.create(
  name: "Sandy",
  role: developer,
  location: denver,
)
Person.create(
  name: "Eve",
  role: manager,
  location: new_york,
)
Person.create(
  name: "Graham",
  role: developer,
  location: berlin,
)
