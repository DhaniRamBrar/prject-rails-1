require 'net/http'
require 'json'

# Clear existing data to prevent duplication
Category.destroy_all
ApiEntry.destroy_all

# Fetch API data
url = 'https://api.publicapis.org/entries'
uri = URI(url)
response = Net::HTTP.get(uri)
parsed_response = JSON.parse(response)

# Seed Categories and API Entries
parsed_response["entries"].each do |entry|
  # Find or create the category
  category = Category.find_or_create_by!(name: entry["Category"])

  # Create the API entry
  ApiEntry.create!(
    api_name: entry["API"],
    description: entry["Description"],
    auth: entry["Auth"],
    https: entry["HTTPS"],
    cors: entry["Cors"],
    link: entry["Link"],
    category: category
  )
end

# Generate Faker Data for each API Entry
ApiEntry.find_each do |api_entry|
  5.times do
    FakerDatum.create!(
      api_entry: api_entry,
      user_name: Faker::Name.name,
      user_email: Faker::Internet.email,
      review: Faker::Lorem.sentence(word_count: 15)
    )
  end
end

puts "Data stored in DB!"
