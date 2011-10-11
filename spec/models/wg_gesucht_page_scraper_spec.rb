require 'spec_helper'

describe "it parses shared flats" do

  before(:all) do
    @url = "http://www.wg-gesucht.de/my_url"
    @attributes = PageScraper::WGGesucht.new(hpricot_doc_for('rotwandstrasse'), @url).attributes
  end
  
  it "stores basic attributes in the flat model" do
    assert_equal @url, @attributes[:url]
    assert_equal Flat::STATES.first, @attributes[:state]
  end
  
  it "parses square_meters", :type => :smoke do
    assert_equal 18, @attributes[:square_meters]
  end
  
  it "parses dates" do
    assert_equal Date.parse("01.11.2011"), @attributes[:available_on]
  end
  
  it "parses price" do
    assert_equal 400, @attributes[:price]      
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
    assert_match /^Hey ihr/, @attributes[:description]
  end
  
  # does not work for WGs, only for appartments
  #it "parses rooms" do
  #  assert_equal nil, @attributes[:rooms]
  #end
  
  private
  
    def hpricot_doc_for(file)
      open(File.join(File.dirname(__FILE__), "/test_data/#{file}.html")) { |f| Hpricot(f) }
    end
  
end