require 'spec_helper'
require 'ostruct'

feature "Creating a flat" do

  def create_flat_with(flat)
    visit(root_path)
    click_on('Add flat')
    click_on('Continue')
    fill_in('Street', :with => flat.street)
    fill_in('Neighbourhood', :with => flat.neighbourhood)
    fill_in('Square meters', :with => flat.square_meters)
    fill_in('Price', :with => flat.price)
    click_on('Create')
  end
  
  background { sign_in_with_form }
  
  scenario "Create a flat with all required attributes", :type => :smoke do
    create_flat_with(Factory.build(:flat))
    page.should have_content('flat was successfully created.')
  end
  
  scenario "I get an error when required attributes are missing" do
    create_flat_with(Factory.build(:flat, :street => nil))
    page.should have_css('h2', :text => /error/)
  end
  
end