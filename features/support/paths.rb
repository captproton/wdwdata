module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the foods list/
      foods_path
      
    when /the food show page for "(.+)"/
      food_path(Food.find_by_name($1))
    
    when /the menus list/
      menus_path
      
    when /the menu show page for "(.+)"/
      menu_path(Menu.find_by_name($1))
    

    when /the eateries list/
      eateries_path
      
    when /the eatery show page for "(.+)"/
      eatery_path(Eatery.find_by_permalink($1))
    
    when /the districts list/
      districts_path
      
    when /the district show page for "(.+)"/
      district_path(District.find_by_permalink($1))
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
