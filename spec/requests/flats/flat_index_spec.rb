require 'spec_helper'

feature "Viewing the flats index" do

  background { @user = sign_in_with_form }

  scenario "A user only sees his own flats" do
    @other_user = Factory.create(:user)
    Factory.create(:flat, :street => 'My flat', :user => @user)
    Factory.create(:flat, :street => 'Other flat', :user => @other_user)
    visit(flats_path)
    page.should have_content("My flat")
    page.should_not have_content("Other flat")
  end
  
  scenario "A user sees normally hidden flats in the all flats view" do
    Factory.create(:flat, :street => 'My flat', :user => @user, :state => 'not_available')
    visit(all_flats_path)
    page.should have_content("My flat")
  end
  
end