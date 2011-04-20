namespace :app do

  desc 'Grab dining data from Touring Plans.'
  task :update => :environment do
    district_permalink = ENV["DISTRICT_PERMALINK"] || 'epcot'
    puts "Starting pull for #{district_permalink}"
    @counter_service  = District.find_park_eateries_list_by_permalink_hash(district_permalink).first
    @table_service  = District.find_park_eateries_list_by_permalink_hash(district_permalink).last
    puts "Starting Counter Service for #{district_permalink}"
    @counter_service.each do |eatery|
      Eatery.find_by_permalink_and_update(district_permalink, eatery['permalink']) 
      puts eatery['name']
      puts "--"      
    end
    puts "Starting Table Service for #{district_permalink}" 
    @table_service.each do |eatery|
      Eatery.find_by_permalink_and_update(district_permalink, eatery['permalink']) 
      puts eatery['name']
      puts "--"      
    end
  end
end

# ["Weeds By Wilk",
# "740 Bair Island Road, #304",
# "Redwood City",
# "650-888-2120",
# "weedsbywilk.com"],
