require 'spec_helper'

# describe Eatery do
#   it "should create a eatery with a title and plot" do
#     
#   end
#   it "is not valid without a title"
#   it "is not valid without a plot"
#   # view a list of eateries
# end

describe Eatery do

  it "validates presence of permalink" do
    eatery = Eatery.new
    eatery.should_not be_valid
    eatery.should have(1).error_on :permalink
  end

  it "validates uniqueness of permalink" do
    Eatery.create!(:permalink => "dup", :name => "seing double")
    eatery = Eatery.new(:permalink => "dup")
    eatery.should_not be_valid
    eatery.should have(1).error_on :permalink
  end

  it "validates presence of name" do
    eatery = Eatery.new
    eatery.should_not be_valid
    eatery.should have(1).error_on :name
  end
 
end
