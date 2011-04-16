require 'spec_helper'


describe DistrictsController do

  def mock_district(stubs = {})
    @district ||= mock_model(District, stubs).as_null_object
  end

  context "GET index" do
    it "assigns all districts to @districts" do
      District.stub(:all) { [mock_district] }
      get :index
      assigns[:districts].should == [mock_district]
    end
  end

  context "GET show" do
    it "assigns the requested district as @district" do
      District.stub(:find).with(42) {mock_district}
      get :show, :id => 42
      assigns[:district].should == mock_district
    end
  end

  context "GET new" do
    it "assigns a new district to @district" do
      District.stub(:new) { mock_district }
      get :new
      assigns[:district].should == mock_district
    end
  end

  context "POST create" do
    it "assigns the posted district to @district" do
      District.stub(:new) { mock_district }
      post :create
      assigns[:district].should == mock_district
    end

    context "with valid attributes" do
      before { District.stub(:new) { mock_district(:save => true) } }

      it "saves district" do
        mock_district.should_receive(:save)
        post :create
      end
      
      it "redirects to district show page" do
        post :create
        response.should redirect_to district_url(mock_district)
      end
      
      it "sets a positive notice" do
        post :create
        flash[:notice].should == "District saved successfully!"
      end
      
    end

    context "with invalid attributes" do
      before { District.stub(:new) { mock_district(:save => false) } }

      it "re-renders new template" do
        post :create
        response.should render_template "new"
      end
    end
  end

  context "DELETE destroy" do
    before { District.stub(:find) { mock_district }}

    it "redirects to districts page" do
      delete :destroy, :id => 42
      response.should redirect_to districts_url
    end
    
    it "assigns the requested district as @district" do
      delete :destroy, :id => 42
      assigns[:district].should == mock_district
    end
    
    it "destroys the requested district" do
      mock_district.should_receive :destroy
      delete :destroy, :id => 42
    end
    
    it "sets the proper notice" do
      delete :destroy, :id => 42
      flash[:notice].should == "District has been successfully destroyed!"
    end
  end

  context "GET edit" do
    before { District.stub(:find) { mock_district} }
    
    it "assigns the requested district as @district" do
      get :edit, :id => 42
      assigns[:district].should == mock_district
    end
  end

  context "PUT update" do

    it "assigns the requested district as @district" do
      District.stub(:find).with(42) { mock_district }
      put :update, :id => 42
      assigns[:district].should == mock_district
    end
    
    context "with valid attributes" do
      before { District.stub(:find) { mock_district(:update_attributes => true) } }

      it "redirects to district show page" do
        put :update, :id => 42
        response.should redirect_to district_url(@district)
      end

      it "updates @district" do
        mock_district.should_receive(:update_attributes)
        put :update, :id => 42
      end
      
      it "sets the proper notice" do
        put :update, :id => 42
        flash[:notice].should == "Successfully updated district!"
      end
      
    end

    context "with invalid attributes" do
      before { District.stub(:find) { mock_district(:update_attributes => false) } }

      it "re-renders the edit form" do
        put :update, :id => 42
        response.should render_template "edit"
      end
      
    end
  end
end
