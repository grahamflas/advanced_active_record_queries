# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or find_or_create_by!d alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_find_or_create_by!_by!(name: genre_name)
#   end
east = Region.find_or_create_by!(name: "East")
west = Region.find_or_create_by!(name: "West")
central_europe = Region.find_or_create_by!(name: "Central Europe")

boston = Location.find_or_create_by!(name: "Boston", region: east)
new_york = Location.find_or_create_by!(name: "New York", region: east)
denver = Location.find_or_create_by!(name: "Denver", region: west)
berlin = Location.find_or_create_by!(name: "Berlin", region: central_europe)

developer = Role.find_or_create_by!(
  name: "Developer",
  billable: true,
)

manager = Role.find_or_create_by!(
  name: "Manager",
  billable: false,
)

Person.find_or_create_by!(
  name: "Wendell",
  role: developer,
  location: boston,
)
Person.find_or_create_by!(
  name: "Christie",
  role: developer,
  location: boston,
)
Person.find_or_create_by!(
  name: "Sandy",
  role: developer,
  location: denver,
)
Person.find_or_create_by!(
  name: "Eve",
  role: manager,
  location: new_york,
)
Person.find_or_create_by!(
  name: "Graham",
  role: developer,
  location: berlin,
)
