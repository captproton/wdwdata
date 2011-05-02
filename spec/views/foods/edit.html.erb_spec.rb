require 'spec_helper'

describe "foods/edit.html.erb" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :name => "MyString",
      :description => "MyText",
      :menu_item_id => 1,
      :default_price => "9.99"
    ))
  end

  it "renders the edit food form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => foods_path(@food), :method => "post" do
      assert_select "input#food_name", :name => "food[name]"
      assert_select "textarea#food_description", :name => "food[description]"
      assert_select "input#food_menu_item_id", :name => "food[menu_item_id]"
      assert_select "input#food_default_price", :name => "food[default_price]"
    end
  end
end
