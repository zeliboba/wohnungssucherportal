require 'spec_helper'

feature "Visits" do

  background do
    user = sign_in_with_form
    @flat_passed = Factory.create(:flat, :visit_at => Time.now - 2.days, :user => user)
    @flat_future = Factory.create(:flat, :visit_at => Time.now + 2.days, :user => user)
  end
  
  scenario "It formats future/past visits correctly", :type => :smoke do
    visit(visits_path)
    page.should have_css('li.passed', :text => @flat_passed.street)
    page.should have_css('li', :text => @flat_future.street)
  end
  
end
