require 'spec_helper'

describe "menu_items/show.html.erb" do
  before(:each) do
    @menu_item = assign(:menu_item, stub_model(MenuItem,
      :menu_id => 1,
      :food_id => 1,
      :price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/9.99/)
  end
end
