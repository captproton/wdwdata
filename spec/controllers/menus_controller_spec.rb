require 'spec_helper'

describe MenusController do

  def mock_menu(stubs = {})
    @menu ||= mock_model(Menu, stubs).as_null_object
  end

  context "GET index" do
    it "assigns all menus to @menus" do
      Menu.stub(:all) { [mock_menu] }
      get :index
      assigns[:menus].should == [mock_menu]
    end
  end

  context "GET show" do
    it "assigns the requested menu as @menu" do
      Menu.stub(:find).with(42) {mock_menu}
      get :show, :id => 42
      assigns[:menu].should == mock_menu
    end
  end

  context "GET new" do
    it "assigns a new menu to @menu" do
      Menu.stub(:new) { mock_menu }
      get :new
      assigns[:menu].should == mock_menu
    end
  end

  context "POST create" do
    it "assigns the posted menu to @menu" do
      Menu.stub(:new) { mock_menu }
      post :create
      assigns[:menu].should == mock_menu
    end

    context "with valid attributes" do
      before { Menu.stub(:new) { mock_menu(:save => true) } }

      it "saves menu" do
        mock_menu.should_receive(:save)
        post :create
      end
      
      it "redirects to menu show page" do
        post :create
        response.should redirect_to menu_url(mock_menu)
      end
      
      it "sets a positive notice" do
        post :create
        flash[:notice].should == "Menu saved successfully!"
      end
      
    end

    context "with invalid attributes" do
      before { Menu.stub(:new) { mock_menu(:save => false) } }

      it "re-renders new template" do
        post :create
        response.should render_template "new"
      end
    end
  end

  context "DELETE destroy" do
    before { Menu.stub(:find) { mock_menu }}

    it "redirects to menus page" do
      delete :destroy, :id => 42
      response.should redirect_to menus_url
    end
    
    it "assigns the requested menu as @menu" do
      delete :destroy, :id => 42
      assigns[:menu].should == mock_menu
    end
    
    it "destroys the requested menu" do
      mock_menu.should_receive :destroy
      delete :destroy, :id => 42
    end
    
    it "sets the proper notice" do
      delete :destroy, :id => 42
      flash[:notice].should == "Menu has been successfully destroyed!"
    end
  end

  context "GET edit" do
    before { Menu.stub(:find) { mock_menu} }
    
    it "assigns the requested menu as @menu" do
      get :edit, :id => 42
      assigns[:menu].should == mock_menu
    end
  end

  context "PUT update" do

    it "assigns the requested menu as @menu" do
      Menu.stub(:find).with(42) { mock_menu }
      put :update, :id => 42
      assigns[:menu].should == mock_menu
    end
    
    context "with valid attributes" do
      before { Menu.stub(:find) { mock_menu(:update_attributes => true) } }

      it "redirects to menu show page" do
        put :update, :id => 42
        response.should redirect_to menu_url(@menu)
      end

      it "updates @menu" do
        mock_menu.should_receive(:update_attributes)
        put :update, :id => 42
      end
      
      it "sets the proper notice" do
        put :update, :id => 42
        flash[:notice].should == "Successfully updated menu!"
      end
      
    end

    context "with invalid attributes" do
      before { Menu.stub(:find) { mock_menu(:update_attributes => false) } }

      it "re-renders the edit form" do
        put :update, :id => 42
        response.should render_template "edit"
      end
      
    end
  end

end
