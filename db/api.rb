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
    next if dog['photos'][0].nil?

    attributes = { name: dog['name'],
                   url: dog['url'],
                   breeds: { primary: dog['breeds']['primary'], secondary: dog['breeds']['secondary'], mixed: dog['breeds']['mixed'], unknown: dog['breeds']['unknown'] },
                   gender: dog['gender'],
                   size: dog['size'],
                   coat: dog['coat'],
                   qualities: dog['tags'],
                   # organization_id: dog['organization_id'],
                   colors: { primary: dog['colors']['primary'], secondary: dog['colors']['secondary'] },
                   features: { spayed_neutered: dog['attributes']['spayed_neutered'], house_trained: dog['attributes']['house_trained'], declawed: dog['attributes']['declawed'], special_needs: dog['attributes']['special_needs'], shots_current: dog['attributes']['shots_current'] },
                   environments: { children: dog['environment']['children'], dogs: dog['environment']['dogs'], cats: dog['environment']['cats'] },
                   pictures: { small: dog['photos'][0]['small'], medium: dog['photos'][0]['medium'] },
                   description: dog['description'] }
    Dog.create!(attributes)
  end
  puts "created 100 dogs"
end
