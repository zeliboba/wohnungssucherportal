require 'spec_helper'

feature "Viewing flats" do

  background { @user = sign_in_with_form }

  scenario "clicking on a flat name shows me the details", :type => :smoke do
    flat = Factory.create(:flat, :user => @user)
    visit(flats_path)
    click_link(flat.street)
    page.should have_css('h2', :text => flat.street)
  end
  
end