require 'spec_helper'
require 'ostruct'

feature "Creating a flat" do

  def go_to_create_form
    visit(root_path)
    click_on('Add flat')
    click_on('Continue')
  end
  
  def fill_form(flat)
    fill_in('Street', :with => flat.street)
    fill_in('Neighbourhood', :with => flat.neighbourhood)
    fill_in('Square meters', :with => flat.square_meters)
    fill_in('Price', :with => flat.price)
    click_on('Create')
  end
  
  scenario "Create a flat with all required attributes", :type => :smoke do
    go_to_create_form
    fill_form(Factory.build(:flat))
    page.should have_content('flat was successfully created.')
  end
  
  scenario "I get an error when required attributes are missing" do
    go_to_create_form
    fill_form(Factory.build(:flat, :street => nil, :price => nil))
    page.should have_css('h2', :text => /error/)
  end
  
end