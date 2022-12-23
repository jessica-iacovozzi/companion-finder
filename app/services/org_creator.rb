require "json"
require 'rest-client'

class OrganizationCreator < ApplicationService
  def call
    Organization.destroy_all

    url = 'https://api.petfinder.com/v2/organizations?location=montreal, quebec&distance=50&limit=100'
    user_serialized = RestClient.get url, { Authorization: "Bearer #{ENV.fetch('PETFINDER_BEARER')}" }
    orgs_json = JSON.parse(user_serialized)
    orgs = orgs_json['organizations']
    $organizations = []

    orgs.map do |org|
      next if org['photos'][0].nil?

      attributes = { org_id: org['id'],
                     name: org['name'],
                     email: org['email'],
                     phone: org['phone'],
                     city: org['address']['city'],
                     postcode: org['address']['postcode'],
                     picture: org['photos'][0]['full'] }
      Organization.create!(attributes)
      $organizations << org['id']
    end
    puts "created #{$organizations.count} organizations"
  end
end
