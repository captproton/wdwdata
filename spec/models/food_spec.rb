require 'spec_helper'

describe Food do
  it "validates presence of name" do
    food = Food.new
    food.should_not be_valid
    food.should have_at_least(1).errors_on :name
  end
  
  it "validates uniqueness of name" do
    Food.create!(:name => "dup", :description => "seing double")
    seconds = Food.new(:name => "dup")
    seconds.should_not be_valid
    seconds.should have_at_least(1).errors_on :name
  end
  
end
