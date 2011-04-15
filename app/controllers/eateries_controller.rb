class EateriesController < ApplicationController
  def index
    @eateries = Eatery.all
  end

  # GET /eateries/1
  # GET /eateries/1.xml
  def show
    @eatery = Eatery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /eateries/new
  # GET /eateries/new.xml
  def new
    @eatery = Eatery.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @eatery = Eatery.new(params[:eatery])

    respond_to do |format|
      if @eatery.save
        format.html { redirect_to(@eatery, :notice => 'Eatery saved successfully!') }
      else
        format.html { render :action => "new" }
      end
    end
    
  end

  def destroy
    @eatery = Eatery.find params[:id]
    @eatery.destroy
    redirect_to eateries_url, :notice => "Eatery has been successfully destroyed!"
  end

  def edit
    @eatery = Eatery.find params[:id]
  end
  
  def update
    @eatery = Eatery.find params[:id]
    if @eatery.update_attributes params[:eatery]
      redirect_to eatery_url(@eatery), :notice => "Successfully updated eatery!"
    else
      render :action => "edit"
    end
  end
  
  def show
    @eatery = Eatery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
