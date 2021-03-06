# encoding: utf-8

class Eatery < ActiveRecord::Base
  require 'iconv'
  include HTTParty

  base_uri 'touringplans.com'
  default_params :output => 'json'
  format :json

  # http://touringplans.com/disneyland-resort/dining/napa-rose.json
  # http://touringplans.com/walt-disney-world/dining/big-river-grille-brewing-works.json
  # http://touringplans.com/disneyland-resort/dining/napa-rose.json
  # http://touringplans.com/walt-disney-world/dining/big-river-grille-brewing-works.json

  # Eatery.find_by_district_and_permalink('magic-kingdom', 'columbia-harbor-house')
  def self.find_remote_by_district_and_permalink(district_permalink, permalink)
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
  def self.find_and_update_resorts(info_credit)
    @resort_list = District.find_resort_eateries_list_by_permalink
    # puts @resort_list.first['name']
    @resort_list.each do |resort|
      permalink =  resort['permalink']
      name      =  resort['name']
      puts name + ', ' + permalink
      @district =   District.find_by_permalink(permalink)      
      @district ||= District.new(:name => name, 
                                :permalink => permalink, 
                                :is_park => false, 
                                :credit => 'touringplans.com')
      @district.save!
      dinings = resort['dinings']
      if !dinings.blank?
        dinings.each do |eatery|
          permalink = eatery['permalink']
          puts permalink
          @there  = Eatery.find_remote_by_district_and_permalink('walt-disney-world', permalink) # grab remote
                    # eatery details          
          @eatery = Eatery.find_by_permalink(permalink) # grab eatery if is exists.  If not found, the next line
                    # evaluates.
          @eatery ||= Eatery.new(@there) # get existing eatery or create new eatery if it doesn't already exist
          @eatery.district = @district
          @eatery.credit = info_credit
          @eatery.save! 
        end
      end
      
    end
    # puts @resort_list
    # @counter_service = @park_list.first # return existing or new park list of counter service from json 
    # @table_service = @park_list.last # return existing or new park list of table service from json 
  end
 
  def self.find_by_permalink_and_update(park_permalink, permalink, info_credit) 
    @district =   District.find_by_permalink(park_permalink) 
    district_name = park_permalink.gsub(/\b\w/) { $&.upcase }
    district_name = district_name.gsub(/[-\s]/, ' ')
    @district ||= District.new(:name => district_name, 
                              :permalink => park_permalink, 
                              :is_park => true, 
                              :credit => 'touringplans.com')
    @district.save!
    puts 'start find_by_permalink_and_update'
    puts 'park_permalink ' + @district.permalink
    puts 'permalink ' + permalink
    puts 'info_credit ' + info_credit
    puts '---'
    # determine if the eatery was already created, and create one if it didn't
    @there  = Eatery.find_remote_by_district_and_permalink(park_permalink, permalink) # grab remote eatery details
    @eatery = Eatery.find_by_permalink(permalink) # grab eatery if is exists.  If not found, the next line
              # evaluates.
    @eatery ||= Eatery.new(@there) # get existing eatery or create new eatery if it doesn't already exist
    @eatery.district = @district # set parent district
    @eatery.credit = info_credit
    @eatery.save! 
    rescue ActiveRecord::RecordNotSaved
      puts 'Unable to create eatery'    
  end
  
  validates_presence_of :permalink
  validates_presence_of :name
  validates_uniqueness_of :permalink
  belongs_to :district
  has_many :menus
end
