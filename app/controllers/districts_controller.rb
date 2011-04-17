class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end

  # GET /districts/new
  # GET /districts/new.xml
  def new
    @district = District.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @district = District.new(params[:district])

    respond_to do |format|
      if @district.save
        format.html { redirect_to(@district, :notice => 'District saved successfully!') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # GET /eateries/1
  # GET /eateries/1.xml
  def show
    @district = District.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def edit
    @district = District.find params[:id]
  end

  def update
    @district = District.find params[:id]
    if @district.update_attributes params[:district]
      redirect_to district_url(@district), :notice => "Successfully updated district!"
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @district = District.find params[:id]
    @district.destroy
    redirect_to districts_url, :notice => "District has been successfully destroyed!"
  end
  
end
