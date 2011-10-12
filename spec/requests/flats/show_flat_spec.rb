require 'spec_helper'

feature "Showing flats" do

  background { @user = sign_in_with_form }

  scenario "clicking on a flat name shows me the details", :type => :smoke do
    flat = Factory.create(:flat, :user => @user)
    visit(flats_path)
    click_link(flat.street)
    page.should have_css('h2', :text => flat.street)
  end

  scenario "A user should not see other user's flats" do
    other_user = Factory.create(:user)
    flat = Factory.create(:flat, :user => other_user)
    visit(flat_path(flat.id))
    page.should_not have_css('h2', :text => flat.street)
    page.should have_flash("could not be found")
  end
  
end