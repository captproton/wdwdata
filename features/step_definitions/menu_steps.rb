Given /^an eatery with the permalink "([^"]*)" and the name "([^"]*)"$/ do |permalink, name|
  Eatery.create!(:permalink => permalink, :name => name)
end

Given /^a menu with the name "([^"]*)"$/ do |name|
  Menu.create!(:name => name)
end

Given /^a menu with the name "([^"]*)"$/ do |name|
  Menu.create!(:name => name)
end

Given /^there is no menu with the name "([^"]*)"$/ do |menu|
  Menu.find_by_name(menu).should_not == true
end

Then /^I should see "([^"]*)" on the menus list$/ do |name|
  visit eatery_menus_url
  page.should have_content name
end

Then /^I should not see "([^"]*)" on the menus list$/ do |name|
  visit eatery_menus_url
  page.should_not have_content name
end

Given /^a menu with the name "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
