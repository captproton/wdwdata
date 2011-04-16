class District < ActiveRecord::Base
  include HTTParty
  # base_uri 'whoismyrepresentative.com'
  base_uri 'touringplans.com'
  default_params :output => 'json'
  format :json

  # Eatery.find_by_district_and_permalink('magic-kingdom', 'columbia-harbor-house')
  def self.find_by_district_and_permalink(district, permalink)
    get('/' + district + '/dining/' + permalink + '.json')    
  end

  def self.find_kid_eateries_by_permalink(district)
    get('/' + district + '/dining.json')
  end
  
  ## nb: broken in to two parts.  @hash.first is counter services, and @hash.second is table service
  def self.find_kid_eateries_by_permalink_hash(district)
    self.find_kid_eateries_by_permalink(district).parsed_response
  end

  validates_presence_of :permalink
  validates_presence_of :name
  validates_uniqueness_of :permalink
  
end
