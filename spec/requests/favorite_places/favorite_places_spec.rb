require 'spec_helper'

feature "Favorite places" do
  
  scenario "It displays the page", :type => :smoke do
    visit(favorite_places_path)
    page.should have_css('h1', :text => "Favorite places")
  end
  
end
