class Eatery < ActiveRecord::Base
  include HTTParty
  # base_uri 'whoismyrepresentative.com'
  base_uri 'touringplans.com'
  default_params :output => 'json'
  format :json

  # Eatery.find_by_district_and_permalink('magic-kingdom', 'columbia-harbor-house')
  def self.find_by_district_and_permalink(district, permalink)
    get('/' + district + '/dining/' + permalink + '.json')    
  end
  
  validates_presence_of :permalink
  validates_presence_of :name
  validates_uniqueness_of :permalink
end
