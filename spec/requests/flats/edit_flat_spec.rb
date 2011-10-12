require 'spec_helper'

feature "Editing flats" do

  background { @user = sign_in_with_form }

  scenario "A user should not be able to edit user's flats" do
    other_user = Factory.create(:user)
    flat = Factory.create(:flat, :user => other_user)
    visit(edit_flat_path(flat.id))
    page.should_not have_css('h2', :text => flat.street)
    page.should have_flash("could not be found")
  end
  
end