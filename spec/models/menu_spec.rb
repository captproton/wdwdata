require 'spec_helper'

describe Menu do
  it "validates presence of name" do
    menu = Menu.new
    menu.should_not be_valid
    menu.should have(1).error_on :name
  end
end
