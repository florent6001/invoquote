# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Business.destroy_all
User.destroy_all

User.create!(
  first_name: 'Florent',
  last_name: 'Vandroy',
  email: 'florentvandroy@gmail.com',
  password: 'password'
)

Business.create(
  name: "WebDev",
  address: "Bordeaux",
  phone_number: "0606060606",
  email: "professionnal_email@domain.com",
  registration_number: "0987654321",
  tax_rate: "2O",
  user: User.first
)
