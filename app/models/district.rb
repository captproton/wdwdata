class District < ActiveRecord::Base
  include HTTParty
  # base_uri 'whoismyrepresentative.com'

  # resort doesn't mean an individual lodge, but wdw or disneyland
  # retreat refers to cruise ships, hotels, villas, and lodges on property of the resort
  ## nb: Each district is subdivided at touringplans.com.  The parks are divided into counter service and table
  # service.  The resort dining is segregated by each lodging location, or retreat.

  base_uri 'touringplans.com'
  default_params :output => 'json'
  format :json

  # http://touringplans.com/magic-kingdom/dining.json
  def self.find_park_eateries_list_by_permalink(district)
    get('/' + district + '/dining.json')
  end

  def self.find_park_eateries_list_by_permalink_hash(district)
    self.find_list_of_retreat_eateries_by_resort_permalink(district).parsed_response
  end
  
  # http://touringplans.com/walt-disney-world/resort-dining.json
  # http://touringplans.com/walt-disney-world/resort-dining.json
  def self.find_list_of_retreat_eateries_by_resort_permalink(resort_permalink)
    get('/' + resort_permalink + '/resort-dining.json')
  end
  
  def self.find_list_of_retreat_eateries_by_resort_permalink_hash(resort_permalink)
    self.find_list_of_retreat_eateries_by_resort_permalink(district).parsed_response
  end


  validates_presence_of :permalink
  validates_presence_of :name
  validates_uniqueness_of :permalink
  
end
