Given /^a food with the name "([^"]*)" and the description "([^"]*)"$/ do |description, name|
  Food.create!(:description => description, :name => name)
end

Given /^there is no food with the name "([^"]*)"$/ do |name|
  Food.find_by_name(name).should_not == true
end

Then /^I should see "([^"]*)" on the foods list$/ do |name|
  visit foods_url
  page.should have_content name
end

Then /^I should not see "([^"]*)" on the foods list$/ do |name|
  visit foods_url
  page.should_not have_content name
end

Given /^a food with the name "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
