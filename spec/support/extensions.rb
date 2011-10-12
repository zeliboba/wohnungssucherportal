RSpec.configure do |config|

  # very nice. http://blog.plataformatec.com.br/2011/02/improving-your-tests-with-capybara-custom-selectors/
  Capybara.add_selector(:li) do
    xpath { |num| ".//li[#{num}]" }
  end
  Capybara.add_selector(:tr) do
    xpath { |num| ".//tr[#{num}]" }
  end
    
  def show!
    save_and_open_page
  end

  def sign_in_with_form
    visit(new_user_session_path)
    @sign_in_user = Factory.create(:user)
    fill_in('Email', :with => @sign_in_user.email)
    fill_in('Password', :with => @sign_in_user.password)
    click_on('Sign in')
    @sign_in_user
  end
    
  include Devise::TestHelpers
end

RSpec::Matchers.define :have_flash do |expected_message|
  match do |actual|
    page.should have_css('p.flash', :text => expected_message)
  end
  failure_message_for_should do |actual|
    "expected flash message '#{expected_message}', but none found."
  end
end