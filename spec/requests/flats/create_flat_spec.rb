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
  
  scenario "Creating a flat from scratch", :type => :smoke do
    go_to_create_form
    fill_form(Factory.build(:flat))
    page.should have_content('flat was successfully created.')
  end
  
  scenario "I get a validation error when required info is missing" do
    go_to_create_form
    fill_form(Factory.build(:flat, :street => nil, :price => nil))
    show!
    page.should have_css('h2', :text => /error/)
  end
  
end