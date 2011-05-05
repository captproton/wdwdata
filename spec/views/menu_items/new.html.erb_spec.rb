require 'spec_helper'

describe "menu_items/new.html.erb" do
  before(:each) do
    assign(:menu_item, stub_model(MenuItem,
      :menu_id => 1,
      :food_id => 1,
      :price => "9.99"
    ).as_new_record)
  end

  it "renders new menu_item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menu_items_path, :method => "post" do
      assert_select "input#menu_item_menu_id", :name => "menu_item[menu_id]"
      assert_select "input#menu_item_food_id", :name => "menu_item[food_id]"
      assert_select "input#menu_item_price", :name => "menu_item[price]"
    end
  end
end
