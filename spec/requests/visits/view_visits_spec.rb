require 'spec_helper'

feature "Visits" do
  
  background do
    @flat_passed = Factory.create(:flat, :visit_at => Time.now - 2.days)
    @flat_future = Factory.create(:flat, :visit_at => Time.now + 2.days)
  end
  
  scenario "It formats future/past visits correctly", :type => :smoke do
    visit(visits_path)
    page.should have_css('li.passed', :text => @flat_passed.street)
    page.should have_css('li', :text => @flat_future.street)
  end
  
end
