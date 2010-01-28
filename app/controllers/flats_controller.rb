class FlatsController < ApplicationController

  def index
    @flats = Flat.available.ordered(params[:order])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flats }
    end
  end

  def show
    @flat = Flat.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flat }
    end
  end

  def new
    defaults = {:available_on => Time.parse('01.01.2010'), :state => Flat::STATES.first}
    @flat = Flat.new(defaults)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.from_url(params[:flat][:url])

    if @flat.save
      flash[:notice] = 'flat was successfully created.'
      flash[:created_flat_id] = @flat.id
      redirect_to flats_path
    else
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
