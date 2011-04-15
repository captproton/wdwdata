require 'spec_helper'


describe EateriesController do

  def mock_eatery(stubs = {})
    @eatery ||= mock_model(Eatery, stubs).as_null_object
  end

  context "GET index" do
    it "assigns all eateries to @eateries" do
      Eatery.stub(:all) { [mock_eatery] }
      get :index
      assigns[:eateries].should == [mock_eatery]
    end
  end

  context "GET show" do
    it "assigns the requested eatery as @eatery" do
      Eatery.stub(:find).with(42) {mock_eatery}
      get :show, :id => 42
      assigns[:eatery].should == mock_eatery
    end
  end

  context "GET new" do
    it "assigns a new eatery to @eatery" do
      Eatery.stub(:new) { mock_eatery }
      get :new
      assigns[:eatery].should == mock_eatery
    end
  end

  context "POST create" do
    it "assigns the posted eatery to @eatery" do
      Eatery.stub(:new) { mock_eatery }
      post :create
      assigns[:eatery].should == mock_eatery
    end

    context "with valid attributes" do
      before { Eatery.stub(:new) { mock_eatery(:save => true) } }

      it "saves eatery" do
        mock_eatery.should_receive(:save)
        post :create
      end
      
      it "redirects to eatery show page" do
        post :create
        response.should redirect_to eatery_url(mock_eatery)
      end
      
      it "sets a positive notice" do
        post :create
        flash[:notice].should == "Eatery saved successfully!"
      end
      
    end

    context "with invalid attributes" do
      before { Eatery.stub(:new) { mock_eatery(:save => false) } }

      it "re-renders new template" do
        post :create
        response.should render_template "new"
      end
    end
  end

  context "DELETE destroy" do
    before { Eatery.stub(:find) { mock_eatery }}

    it "redirects to eateries page" do
      delete :destroy, :id => 42
      response.should redirect_to eateries_url
    end
    
    it "assigns the requested eatery as @eatery" do
      delete :destroy, :id => 42
      assigns[:eatery].should == mock_eatery
    end
    
    it "destroys the requested eatery" do
      mock_eatery.should_receive :destroy
      delete :destroy, :id => 42
    end
    
    it "sets the proper notice" do
      delete :destroy, :id => 42
      flash[:notice].should == "Eatery has been successfully destroyed!"
    end
  end

  context "GET edit" do
    before { Eatery.stub(:find) { mock_eatery} }
    
    it "assigns the requested eatery as @eatery" do
      get :edit, :id => 42
      assigns[:eatery].should == mock_eatery
    end
  end

  context "PUT update" do

    it "assigns the requested eatery as @eatery" do
      Eatery.stub(:find).with(42) { mock_eatery }
      put :update, :id => 42
      assigns[:eatery].should == mock_eatery
    end
    
    context "with valid attributes" do
      before { Eatery.stub(:find) { mock_eatery(:update_attributes => true) } }

      it "redirects to eatery show page" do
        put :update, :id => 42
        response.should redirect_to eatery_url(@eatery)
      end

      it "updates @eatery" do
        mock_eatery.should_receive(:update_attributes)
        put :update, :id => 42
      end
      
      it "sets the proper notice" do
        put :update, :id => 42
        flash[:notice].should == "Successfully updated eatery!"
      end
      
    end

    context "with invalid attributes" do
      before { Eatery.stub(:find) { mock_eatery(:update_attributes => false) } }

      it "re-renders the edit form" do
        put :update, :id => 42
        response.should render_template "edit"
      end
      
    end
  end
end
