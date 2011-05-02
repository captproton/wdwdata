require 'spec_helper'

describe "foods/new.html.erb" do
  before(:each) do
    assign(:food, stub_model(Food,
      :name => "MyString",
      :description => "MyText",
      :menu_item_id => 1,
      :default_price => "9.99"
    ).as_new_record)
  end

  it "renders new food form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => foods_path, :method => "post" do
      assert_select "input#food_name", :name => "food[name]"
      assert_select "textarea#food_description", :name => "food[description]"
      assert_select "input#food_menu_item_id", :name => "food[menu_item_id]"
      assert_select "input#food_default_price", :name => "food[default_price]"
    end
  end
end
