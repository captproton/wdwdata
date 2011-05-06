namespace :app do

  desc 'Grab dining data from Touring Plans.'
  task :update => :environment do
    district_permalink = ENV["DISTRICT_PERMALINK"] || 'epcot'
    info_credit = ENV["INFO_CREDIT"] || 'touringplans.com'
    if district_permalink == 'walt-disney-world' ## means the update is for resort dining, not in the parks
      puts 'that is not ready yet'
    else
      
      puts "Starting pull for #{district_permalink}"
      @counter_service  = District.find_park_eateries_list_by_permalink_hash(district_permalink).first
      @table_service  = District.find_park_eateries_list_by_permalink_hash(district_permalink).last
      puts "Starting Counter Service for #{district_permalink}"
      @counter_service.each do |eatery|
        puts eatery['permalink']
        Eatery.find_by_permalink_and_update(district_permalink, eatery['permalink'], info_credit) 
        puts eatery['name']
        puts "--"      
      end
      puts "Starting Table Service for #{district_permalink}" 
      @table_service.each do |eatery|
        puts eatery['permalink']
        Eatery.find_by_permalink_and_update(district_permalink, eatery['permalink'], info_credit) 
        puts eatery['name']
        puts "--"      
      end
    end  
  end
end

# ["Weeds By Wilk",
# "740 Bair Island Road, #304",
# "Redwood City",
# "650-888-2120",
# "weedsbywilk.com"],
