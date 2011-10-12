class VisitsController < ApplicationController
  def show
    @flats = current_user.flats.have_visits
  end

end
