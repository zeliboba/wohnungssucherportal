require 'spec_helper'

feature "Visits" do
  
  scenario "It displays the page", :type => :smoke do
    visit(visits_path)
    page.should have_css('h1', :text => "Visits")
  end
  
end
