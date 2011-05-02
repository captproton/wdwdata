require "spec_helper"

describe FoodsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/foods" }.should route_to(:controller => "foods", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/foods/new" }.should route_to(:controller => "foods", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/foods/1" }.should route_to(:controller => "foods", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/foods/1/edit" }.should route_to(:controller => "foods", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/foods" }.should route_to(:controller => "foods", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/foods/1" }.should route_to(:controller => "foods", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/foods/1" }.should route_to(:controller => "foods", :action => "destroy", :id => "1")
    end

  end
end
