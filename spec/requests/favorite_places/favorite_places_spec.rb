require 'spec_helper'

feature "Favorite places" do
  
  scenario "It displays the page", :type => :smoke do
    sign_in_with_form
    visit(favorite_places_path)
    page.should have_css('h1', :text => "Favorite places")
  end
  
end
