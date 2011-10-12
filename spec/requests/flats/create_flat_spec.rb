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
    flat = Factory.build(:flat)
    create_flat_with(flat)
    page.should have_flash("successfully created")
     # check that I can see the flat, i.e. it was correctly assigned to user me
    page.should have_content(flat.street)
  end
  
  scenario "I get an error when required attributes are missing" do
    create_flat_with(Factory.build(:flat, :street => nil))
    page.should have_flash("can't be blank")
  end
  
end