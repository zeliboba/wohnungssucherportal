RSpec.configure do |config|
  
  # very nice. http://blog.plataformatec.com.br/2011/02/improving-your-tests-with-capybara-custom-selectors/
  Capybara.add_selector(:li) do
    xpath { |num| ".//li[#{num}]" }
  end
  Capybara.add_selector(:tr) do
    xpath { |num| ".//tr[#{num}]" }
  end
  
end