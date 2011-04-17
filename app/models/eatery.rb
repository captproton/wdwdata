class Eatery < ActiveRecord::Base
  include HTTParty
  # base_uri 'whoismyrepresentative.com'
  base_uri 'touringplans.com'
  default_params :output => 'json'
  format :json

  # http://touringplans.com/disneyland-resort/dining/napa-rose.json
  # http://touringplans.com/walt-disney-world/dining/big-river-grille-brewing-works.json
  # http://touringplans.com/disneyland-resort/dining/napa-rose.json
  # http://touringplans.com/walt-disney-world/dining/big-river-grille-brewing-works.json

  # Eatery.find_by_district_and_permalink('magic-kingdom', 'columbia-harbor-house')
  def self.find_by_district_and_permalink(district_permalink, permalink)
    get('/' + district_permalink + '/dining/' + permalink + '.json').parsed_response
  end
  
  def self.find_and_update_park(park_permalink) 
    unless 	District.find_by_permalink(park_permalink)  # if there's no district created
      @park_list = District.find_park_eateries_list_by_permalink(park_permalink).parsed_response
       # add a new one from the json
    end
    @park_list
    # @counter_service = @park_list.first # return existing or new park list of counter service from json 
    # @table_service = @park_list.last # return existing or new park list of table service from json 
  end
  
  def self.find_by_permalink_and_update(park_permalink, permalink) 
    # determine if the eatery was already created, and create one if it didn't
    @eatery = Eatery.find_by_permalink(permalink)
    @eatery ||= Eatery.new
    
    @eatery.save!
    # Determine if eatery has lastest data
    @there  = Eatery.find_by_district_and_permalink(park_permalink, permalink)
    unless 	@eatery.updated_at ==  @there['updated_at'] # if the eatery doesn't have the latest update
      @eatery.update_attributes @there # add a new one from the json
      # If eatery doesn't have the latest data, update it
      # @eatery.save!
    end
    
  end
  
  validates_presence_of :permalink
  validates_presence_of :name
  validates_uniqueness_of :permalink
end
