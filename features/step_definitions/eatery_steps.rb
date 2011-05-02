Given /^an eatery with the permalink "([^"]*)"$/ do |permalink|
  Eatery.create!(:permalink => permalink)
end

Given /^an eatery with the permalink "([^"]*)" dobe dobe do$/ do |permalink, name|
  Eatery.create!(:permalink => permalink, :name => name)
end

# Given /^an eatery with the permalink "([^"]*)" and the name "([^"]*)"$/ do |permalink, name|
#   Eatery.create!(:permalink => permalink, :name => name)
# end

Given /^there is no eatery with the permalink "([^"]*)"$/ do |eatery|
  Eatery.find_by_permalink(eatery).should_not == true
end

Then /^I should see "([^"]*)" on the eateries list$/ do |permalink|
  visit eateries_url
  page.should have_content permalink
end

Then /^I should not see "([^"]*)" on the eateries list$/ do |permalink|
  visit eateries_url
  page.should_not have_content permalink
end

Given /^an eatery with the name "([^"]*)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end
