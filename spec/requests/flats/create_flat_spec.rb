require File.join(File.dirname(__FILE__), '../../spec_helper')

feature "Creating a flat" do

  scenario "Creating a flat from scratch" do
    visit(root_path)
    click_on('Add flat')
    click_on('Continue')
    f = Factory.build(:flat)
    fill_in('Street', :with => f.street)
    fill_in('Neighbourhood', :with => f.neighbourhood)
    fill_in('Square meters', :with => f.square_meters)
    fill_in('Price', :with => f.price)
    click_on('Create')
    page.should have_content('flat was successfully created.')
    page.should have_css('h2', :text => f.street)
    page.should have_content(f.neighbourhood)
  end
  
  scenario "i get a validation error when price info is missing" do
    visit(root_path)
    click_on('Add flat')
    click_on('Continue')
    fill_in('Street', :with => 'Kazmairstraße 42')
    fill_in('Neighbourhood', :with => 'Westend')
    fill_in('Square meters', :with => '25')
    click_on('Create')
    page.should have_content('2 errors prohibited this flat from being saved')
  end
  
end