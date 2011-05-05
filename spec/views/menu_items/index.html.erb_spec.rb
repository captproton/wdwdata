require 'spec_helper'

describe "menu_items/index.html.erb" do
  before(:each) do
    assign(:menu_items, [
      stub_model(MenuItem,
        :menu_id => 1,
        :food_id => 1,
        :price => "9.99"
      ),
      stub_model(MenuItem,
        :menu_id => 1,
        :food_id => 1,
        :price => "9.99"
      )
    ])
  end

  it "renders a list of menu_items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
