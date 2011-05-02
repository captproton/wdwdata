require 'spec_helper'

describe "foods/index.html.erb" do
  before(:each) do
    assign(:foods, [
      stub_model(Food,
        :name => "Name",
        :description => "MyText",
        :menu_item_id => 1,
        :default_price => "9.99"
      ),
      stub_model(Food,
        :name => "Name",
        :description => "MyText",
        :menu_item_id => 1,
        :default_price => "9.99"
      )
    ])
  end

  it "renders a list of foods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
