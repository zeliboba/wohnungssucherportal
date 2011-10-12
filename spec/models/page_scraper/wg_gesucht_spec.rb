require 'spec_helper'

# see the describe blocks below
shared_examples_for "wg gesucht page scraping spec" do
  
  it "parses square_meters", :type => :smoke do
    assert_equal 12, @attributes[:square_meters]
  end
  
  it "parses dates" do
    assert_equal Date.parse("01.11.2011"), @attributes[:available_on]
  end
  
  it "parses price" do
    assert_equal 295, @attributes[:price]      
  end
  
  it "parses city" do
    assert_equal "München", @attributes[:city]    
  end
  
  it "parses postal code" do
    assert_equal "81539", @attributes[:postal_code]    
  end
  
  it "parses neighbourhood" do
    assert_equal "Obergiesing", @attributes[:neighbourhood]    
  end
  
  it "parses street" do
    assert_equal "Rotwandstr. 1", @attributes[:street]
  end    
  
  it "parses title" do
    assert_equal "Super Lage!", @attributes[:title]
  end    
  
  it "parses contact name" do
    assert_equal "C. Mlynarcik", @attributes[:contact_person]
  end
  
  it "parses the description" do
    assert_match(/^Hey ihr/, @attributes[:description])
  end
  
  # does not work for WGs, only for appartments
  #it "parses rooms" do
  #  assert_equal nil, @attributes[:rooms]
  #end
  
end

module WGGesuchtPageScraperSpecHelper  
  def scraped_attributes(html_file)
    PageScraper::WGGesucht.new(hpricot_doc_for(html_file)).attributes
  end
  private
    def hpricot_doc_for(file)
      open(Rails.root.join("spec/models/test_data/#{file}.html")) { |f| Hpricot(f) }
    end
end

describe "Scraping the standard HTML" do
  include WGGesuchtPageScraperSpecHelper
  before(:all) do
    @attributes = scraped_attributes('rotwandstrasse_standard')
  end  
  it_behaves_like "wg gesucht page scraping spec"
end

describe "Scraping a variation of the HTML" do
  include WGGesuchtPageScraperSpecHelper
  before(:all) do
    @attributes = scraped_attributes('rotwandstrasse_variation')
  end  
  it_behaves_like "wg gesucht page scraping spec"
end