require "json"
require "open-uri"
require "nokogiri"
require 'rest-client'

def api_call
  Dog.destroy_all
  url = 'https://api.petfinder.com/v2/animals?type=dog&age=senior'
  user_serialized = RestClient.get url, { Authorization: "Bearer #{ENV.fetch('PETFINDER_BEARER')}" }
  dogs_json = JSON.parse(user_serialized)
  dogs = dogs_json['animals']

  dogs.map do |dog|
    attributes = { name: dog['name'],
                   url: dog['url'],
                   breeds: dog['breeds'],
                   gender: dog['gender'],
                   size: dog['size'],
                   coat: dog['coat'],
                   qualities: dog['tags'],
                   # organization_id: dog['organization_id'],
                   colors: dog['colors'],
                   features: dog['attributes'],
                   environments: dog['environment'],
                   photos: dog['photos'],
                   description: dog['description'] }
    Dog.create!(attributes)
  end
  puts "created 100 dogs"
end
