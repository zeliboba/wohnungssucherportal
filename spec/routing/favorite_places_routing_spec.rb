require "spec_helper"

describe FavoritePlacesController do
  describe "routing" do

    it "routes to #index" do
      get("/favorite_places").should route_to("favorite_places#index")
    end

    it "routes to #new" do
      get("/favorite_places/new").should route_to("favorite_places#new")
    end

    it "routes to #show" do
      get("/favorite_places/1").should route_to("favorite_places#show", :id => "1")
    end

    it "routes to #edit" do
      get("/favorite_places/1/edit").should route_to("favorite_places#edit", :id => "1")
    end

    it "routes to #create" do
      post("/favorite_places").should route_to("favorite_places#create")
    end

    it "routes to #update" do
      put("/favorite_places/1").should route_to("favorite_places#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/favorite_places/1").should route_to("favorite_places#destroy", :id => "1")
    end

  end
end
