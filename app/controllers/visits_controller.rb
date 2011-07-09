class VisitsController < ApplicationController
  def show
    @flats = Flat.have_visits
    Rails.logger.debug(@flats)
  end

end
