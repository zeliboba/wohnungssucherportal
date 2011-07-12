require File.join(File.dirname(__FILE__), '../../spec_helper')

feature "Creating a flat" do

  scenario "Creating a flat from scratch" do
    visit(root_path)
    click_on('Add flat')
    click_on('Continue')
    fill_in('Street', :with => 'Kazmairstraße 42')
    fill_in('Neighbourhood', :with => 'Westend')
    fill_in('Square meters', :with => '25')
    fill_in('Price', :with => '300')
    click_on('Create')
    page.should have_content('flat was successfully created.')
    page.should have_content('priority')
    page.should have_content('➁')
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