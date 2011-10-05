require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe FavoritePlacesController do

  # This should return the minimal set of attributes required to create a valid
  # FavoritePlace. As you add validations to FavoritePlace, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    Factory.attributes_for(:favorite_place)
  end

  describe "GET index" do
    it "assigns all favorite_places as @favorite_places" do
      favorite_place = FavoritePlace.create! valid_attributes
      get :index
      assigns(:favorite_places).should eq([favorite_place])
    end
  end

  describe "GET show" do
    it "assigns the requested favorite_place as @favorite_place" do
      favorite_place = FavoritePlace.create! valid_attributes
      get :show, :id => favorite_place.id.to_s
      assigns(:favorite_place).should eq(favorite_place)
    end
  end

  describe "GET new" do
    it "assigns a new favorite_place as @favorite_place" do
      get :new
      assigns(:favorite_place).should be_a_new(FavoritePlace)
    end
  end

  describe "GET edit" do
    it "assigns the requested favorite_place as @favorite_place" do
      favorite_place = FavoritePlace.create! valid_attributes
      get :edit, :id => favorite_place.id.to_s
      assigns(:favorite_place).should eq(favorite_place)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FavoritePlace" do
        expect {
          post :create, :favorite_place => valid_attributes
        }.to change(FavoritePlace, :count).by(1)
      end

      it "assigns a newly created favorite_place as @favorite_place" do
        post :create, :favorite_place => valid_attributes
        assigns(:favorite_place).should be_a(FavoritePlace)
        assigns(:favorite_place).should be_persisted
      end

      it "redirects to the created favorite_place" do
        post :create, :favorite_place => valid_attributes
        response.should redirect_to(FavoritePlace.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved favorite_place as @favorite_place" do
        # Trigger the behavior that occurs when invalid params are submitted
        FavoritePlace.any_instance.stub(:save).and_return(false)
        post :create, :favorite_place => {}
        assigns(:favorite_place).should be_a_new(FavoritePlace)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FavoritePlace.any_instance.stub(:save).and_return(false)
        post :create, :favorite_place => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested favorite_place" do
        favorite_place = FavoritePlace.create! valid_attributes
        # Assuming there are no other favorite_places in the database, this
        # specifies that the FavoritePlace created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FavoritePlace.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => favorite_place.id, :favorite_place => {'these' => 'params'}
      end

      it "assigns the requested favorite_place as @favorite_place" do
        favorite_place = FavoritePlace.create! valid_attributes
        put :update, :id => favorite_place.id, :favorite_place => valid_attributes
        assigns(:favorite_place).should eq(favorite_place)
      end

      it "redirects to the favorite_place" do
        favorite_place = FavoritePlace.create! valid_attributes
        put :update, :id => favorite_place.id, :favorite_place => valid_attributes
        response.should redirect_to(favorite_place)
      end
    end

    describe "with invalid params" do
      it "assigns the favorite_place as @favorite_place" do
        favorite_place = FavoritePlace.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FavoritePlace.any_instance.stub(:save).and_return(false)
        put :update, :id => favorite_place.id.to_s, :favorite_place => {}
        assigns(:favorite_place).should eq(favorite_place)
      end

      it "re-renders the 'edit' template" do
        favorite_place = FavoritePlace.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FavoritePlace.any_instance.stub(:save).and_return(false)
        put :update, :id => favorite_place.id.to_s, :favorite_place => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested favorite_place" do
      favorite_place = FavoritePlace.create! valid_attributes
      expect {
        delete :destroy, :id => favorite_place.id.to_s
      }.to change(FavoritePlace, :count).by(-1)
    end

    it "redirects to the favorite_places list" do
      favorite_place = FavoritePlace.create! valid_attributes
      delete :destroy, :id => favorite_place.id.to_s
      response.should redirect_to(favorite_places_url)
    end
  end

end
