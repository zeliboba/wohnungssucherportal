class FlatsController < ApplicationController

  def index
    @flats = Flat.for_index.ordered(params[:order])
  end
  
  def all
    @flats = Flat.all
    render :action => 'index'
  end

  def show
    @flat = Flat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flat }
    end
  end

  def prefill_url_form
  end
  
  def new
    if !params[:url].blank?
      @flat = Flat.from_url(params[:url])
    else
      @flat = Flat.new(:available_on => Time.parse('01.08.2011'))
    end
    @flat.state = Flat::STATES.first
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(params[:flat])

    if @flat.save
      flash[:notice] = 'flat was successfully created.'
      flash[:created_flat_id] = @flat.id
      redirect_to flat_path(@flat)
    else
      flash[:error] = @flat.errors
      render :action => "new"
    end
  end

  def update
    @flat = Flat.find(params[:id])

    respond_to do |format|
      if @flat.update_attributes(params[:flat])
        flash[:notice] = 'flat was successfully updated.'
        format.html { redirect_to(@flat) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flat.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy

    respond_to do |format|
      format.html { redirect_to(flats_url) }
      format.xml  { head :ok }
    end
  end
end
