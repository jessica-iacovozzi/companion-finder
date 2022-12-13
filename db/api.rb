require "json"
require "open-uri"
require "nokogiri"
require 'rest-client'

def api_call
  Dog.destroy_all
  url = "https://api.petfinder.com/v2/animals?type=dog&age=senior"
  RestClient.get(url, { "Authorization: Bearer #{ENV['PETFINDER_BEARER']}" })
  user_serialized = URI.open(url).read
  dogs_json = JSON.parse(user_serialized)
  pp dogs = dogs_json['animals']

  dogs.map do |dog|
    attributes = { name: dog['name'],
                   gender: dog['gender'] }
    # Dog.create!(attributes)
  end
end
