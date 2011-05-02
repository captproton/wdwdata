Given /^an district with the permalink "([^"]*)"$/ do |permalink|
  District.create!(:permalink => permalink)
end

Given /^a district with the permalink "([^"]*)" and the name "([^"]*)"$/ do |permalink, name|
  District.create!(:permalink => permalink, :name => name)
end

Given /^there is no district with the permalink "([^"]*)"$/ do |district|
  District.find_by_permalink(district).should_not == true
end

Then /^I should see "([^"]*)" on the districts list$/ do |permalink|
  visit districts_url
  page.should have_content permalink
end

Then /^I should not see "([^"]*)" on the districts list$/ do |permalink|
  visit districts_url
  page.should_not have_content permalink
end

Given /^a district with the name "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
