class MenuItemsController < ApplicationController
  before_filter(:get_menu)
  
  # GET /menu_items
  # GET /menu_items.xml
  def index
    
    @menu_items = @menu.menu_items
    

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_items }
    end
  end

  # GET /menu_items/1
  # GET /menu_items/1.xml
  def show
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/new
  # GET /menu_items/new.xml
  def new
    # @menu_item = MenuItem.new
    @menu_item = @menu.menu_items.build
    # @menu = @eatery.menus.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_item }
    end
  end

  # GET /menu_items/1/edit
  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  # POST /menu_items
  # POST /menu_items.xml
  def create
    # @menu_item = MenuItem.new(params[:menu_item])
    # @menu = @eatery.menus.build(params[:menu])
    @menu_item = @menu.menu_items.build(params[:menu_item])
    respond_to do |format|
      if @menu_item.save
        # format.html { redirect_to(@menu_item, :notice => 'Menu item was successfully created.') }
        # format.html { redirect_to eatery_menus_url([@eatery], :notice => 'Menu saved successfully!') }
        format.html { redirect_to menu_menu_items_url([@menu], :notice => 'Menu item was successfully created.') }
        
        format.xml  { render :xml => @menu_item, :status => :created, :location => @menu_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /menu_items/1
  # PUT /menu_items/1.xml
  def update
    @menu_item = MenuItem.find(params[:id])
    @menu = @menu_item.menu
    

    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        # format.html { redirect_to(@menu_item, :notice => 'Menu item was successfully updated.') }
        # redirect_to eatery_menus_url([@eatery], :notice => 'Successfully updated menu!')
        format.html { redirect_to menu_menu_items_url([@menu], :notice => 'Successfully updated menu!') }
        
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.xml
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    respond_to do |format|
      # format.html { redirect_to(menu_items_url) }
      format.html { redirect_to menu_menu_items_url, :notice => "Menu has been successfully destroyed!" }
      format.xml  { head :ok }
    end
  end
  
  
  private
  
  def get_menu
    @menu = Menu.find(params[:menu_id])
  end  

end
