require 'spec_helper'

feature "Sorting flats" do

  background { @user = sign_in_with_form }

  scenario "Sorting by price descending works" do
    Factory.create(:flat, :street => 'Cheap', :price => 300, :user => @user)
    Factory.create(:flat, :street => 'Expensive', :price => 500, :user => @user, :created_at => Time.now - 1.minute)
    visit(flats_path)
    within("#flats") do
      # by default, the most recently created flat comes first (created_at DESC)
      find(:tr, 2).should have_content("Cheap")
      find(:tr, 3).should have_content("Expensive")
    end
    click_on('price')
    within("#flats") do
      # price is configured to sort descending (price DESC)
      find(:tr, 2).should have_content("Expensive")
      find(:tr, 3).should have_content("Cheap")
    end
  end
  
end