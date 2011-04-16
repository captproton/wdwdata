require 'spec_helper'

# describe District do
#   it "should create a district with a title and plot" do
#     
#   end
#   it "is not valid without a title"
#   it "is not valid without a plot"
#   # view a list of eateries
# end

describe District do

  it "validates presence of permalink" do
    district = District.new
    district.should_not be_valid
    district.should have(1).error_on :permalink
  end

  it "validates uniqueness of permalink" do
    District.create!(:permalink => "dup", :name => "seing double")
    district = District.new(:permalink => "dup")
    district.should_not be_valid
    district.should have(1).error_on :permalink
  end

  it "validates presence of name" do
    district = District.new
    district.should_not be_valid
    district.should have(1).error_on :name
  end
 
end
