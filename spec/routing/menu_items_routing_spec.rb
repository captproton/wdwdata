require "spec_helper"

describe MenuItemsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/menu_items" }.should route_to(:controller => "menu_items", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/menu_items/new" }.should route_to(:controller => "menu_items", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/menu_items/1" }.should route_to(:controller => "menu_items", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/menu_items/1/edit" }.should route_to(:controller => "menu_items", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/menu_items" }.should route_to(:controller => "menu_items", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/menu_items/1" }.should route_to(:controller => "menu_items", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/menu_items/1" }.should route_to(:controller => "menu_items", :action => "destroy", :id => "1")
    end

  end
end
