# encoding: utf-8
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
  def self.find_park_eateries_list_by_permalink(district_permalink)
    get('/' + district_permalink + '/dining.json')
  end

  # http://touringplans.com/magic-kingdom/dining.json
  def self.find_resort_eateries_list_by_permalink
    get('/walt-disney-world/resort-dining.json').parsed_response
  end

  def self.find_park_eateries_list_by_permalink_hash(district_permalink)
    self.find_park_eateries_list_by_permalink(district_permalink).parsed_response
  end
  
  # http://touringplans.com/walt-disney-world/resort-dining.json
  # http://touringplans.com/walt-disney-world/resort-dining.json
  def self.find_list_of_resort_districts_by_destination_permalink(destination_permalink)
    get('/' + destination_permalink + '/resort-dining.json').parsed_response
  end
  
  def self.find_resort_eatery_by_destination_and_permalink(destination_permalink, permalink)
    get('/'+ destination_permalink +'/dining/' + permalink + '.json').parsed_response
       
  end
  
  # http://touringplans.com/walt-disney-world/resort-dining.json
  def self.find_district_list_by_destination_permalink_and_update_districts(destination_permalink, info_credit) 
    # determine if the eatery was already created, and create one if it didn't
    @list  = District.find_list_of_resort_districts_by_destination_permalink(destination_permalink) # grab list of resort districts details
    @list.each do |resort|
      @district = District.find_by_permalink(resort['permalink']) # test if resort district already exists
      @district ||= District.new # if resort doesn't exist, create it with details from json resort feed
      @district.permalink = resort['permalink']
      @district.name = resort['name']
      @district.credit = info_credit
      # @district.destination = District.find_by_permalink(destination_permalink) # set parent destination
      if @district.save! 
        puts "Saved " + @district.name
      end
      
      if !resort['dinings'].blank?
        puts "Dining not blank"
        resort['dinings'].each do |eatery|
          # http://touringplans.com/walt-disney-world/dining/jiko-the-cooking-place.json
          puts  eatery['permalink']
          puts "destination_permalink is " + destination_permalink
          eatery_permalink = eatery['permalink']
          @eatery = Eatery.find_by_permalink_and_update(destination_permalink, eatery_permalink, info_credit)
          
        end
      end
    end
    
  end


  validates_presence_of :permalink
  validates_presence_of :name
  validates_uniqueness_of :permalink
  has_many :eateries
  
end
