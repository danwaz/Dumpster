class ItemsController < ApplicationController
  # GET /items
  # GET /items.xml
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    unless user_signed_in?
      redirect_to home_path
    end
    
    @item = Item.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    unless user_signed_in?
      redirect_to home_path
    end
    
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.xml
  def create
    unless user_signed_in?
      redirect_to home_path
    end
    
    @item = Item.create(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to(@item, :notice => 'Item was successfully created.') }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    unless user_signed_in?
      redirect_to home_path
    end
    
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@item, :notice => 'Item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    unless user_signed_in?
      redirect_to home_path
    end
    
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
   
      @item = Item.find_by_id(params[:item_search][:search_id])
   
      unless @item.nil?
        
        redirect_to @item
        
        #respond_to do |format|
        #  format.html # show.html.erb
        #  format.xml  { render :xml => @item }
        #end
      else
        flash[:notice] = "invalid input!"
        redirect_to search_path
      end
  end
end
