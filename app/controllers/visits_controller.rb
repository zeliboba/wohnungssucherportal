class VisitsController < ApplicationController
  def show
    @flats = Flat.have_visits
  end

end
