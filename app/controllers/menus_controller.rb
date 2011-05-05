class MenusController < ApplicationController
  before_filter(:get_eatery)
  
  def index
    @menus = @eatery.menus
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def new
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.build
    @menu = @eatery.menus.build
  end
  
  def create
    # @article = Article.find(params[:article_id])
    # @comment = @article.comments.build(params[:comment])
    @menu = @eatery.menus.build(params[:menu])

    respond_to do |format|
      if @menu.save
        format.html { redirect_to eatery_menus_url([@eatery], :notice => 'Menu saved successfully!') }
        
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @menu = Menu.find params[:id]
    @menu.destroy
    redirect_to eatery_menus_url, :notice => "Menu has been successfully destroyed!"
  end

  def update
    @menu = Menu.find params[:id]
    @eatery = @menu.eatery
    
    if @menu.update_attributes params[:menu]
      redirect_to eatery_menus_url([@eatery], :notice => 'Successfully updated menu!')
    else
      render :action => "edit"
    end
  end

  private
  
  def get_eatery
    @eatery = Eatery.find(params[:eatery_id])
  end  

end
