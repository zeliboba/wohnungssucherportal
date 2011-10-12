class FavoritePlacesController < ApplicationController
  # GET /favorite_places
  # GET /favorite_places.json
  def index
    @favorite_places = current_user.favorite_places

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @favorite_places }
    end
  end

  # GET /favorite_places/1
  # GET /favorite_places/1.json
  def show
    @favorite_place = current_user.favorite_places.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @favorite_place }
    end
  end

  # GET /favorite_places/new
  # GET /favorite_places/new.json
  def new
    @favorite_place = current_user.favorite_places.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @favorite_place }
    end
  end

  # GET /favorite_places/1/edit
  def edit
    @favorite_place = current_user.favorite_places.find(params[:id])
  end

  # POST /favorite_places
  # POST /favorite_places.json
  def create
    @favorite_place = current_user.favorite_places.new(params[:favorite_place])

    respond_to do |format|
      if @favorite_place.save
        format.html { redirect_to @favorite_place, :notice => 'Favorite place was successfully created.' }
        format.json { render :json => @favorite_place, :status => :created, :location => @favorite_place }
      else
        format.html { render :action => "new" }
        format.json { render :json => @favorite_place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /favorite_places/1
  # PUT /favorite_places/1.json
  def update
    @favorite_place = current_user.favorite_places.find(params[:id])

    respond_to do |format|
      if @favorite_place.update_attributes(params[:favorite_place])
        format.html { redirect_to @favorite_place, :notice => 'Favorite place was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @favorite_place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_places/1
  # DELETE /favorite_places/1.json
  def destroy
    @favorite_place = current_user.favorite_places.find(params[:id])
    @favorite_place.destroy

    respond_to do |format|
      format.html { redirect_to favorite_places_url }
      format.json { head :ok }
    end
  end
end
