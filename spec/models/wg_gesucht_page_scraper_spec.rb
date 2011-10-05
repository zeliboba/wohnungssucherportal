require 'spec_helper'

describe "it parses shared flats" do

  before(:all) do
    @url = "http://www.wg-gesucht.de/my_url"
    @attributes = PageScraper::WGGesucht.new(hpricot_doc_for('occamstrasse'), @url).attributes
  end
  
  it "stores basic attributes in the flat model" do
    assert_equal @url, @attributes[:url]
    assert_equal Flat::STATES.first, @attributes[:state]
  end
  
  it "parses square_meters", :type => :smoke do
    assert_equal 12, @attributes[:square_meters]
  end
  
  it "parses dates" do
    assert_equal Date.parse("01.08.2011"), @attributes[:available_on]
    assert_equal Date.parse("30.09.2011"), @attributes[:available_until]
  end
  
  it "parses price" do
    assert_equal 320, @attributes[:price]      
  end
  
  it "parses city" do
    assert_equal "München", @attributes[:city]    
  end
  
  it "parses postal code" do
    assert_equal "80802", @attributes[:postal_code]    
  end
  
  it "parses neighbourhood" do
    assert_equal "Schwabing-West", @attributes[:neighbourhood]    
  end
  
  it "parses street" do
    assert_equal "Occamstr 21", @attributes[:street]
  end    
  
  it "parses title" do
    assert_equal "WG-Zimmer in gemütlicher 3er WG zur Zwischenmiete", @attributes[:title]
  end    
  
  it "parses contact name" do
    assert_equal "Lucia", @attributes[:contact_person]
  end
  
  it "parses the description" do
    assert_match /^Hi,/, @attributes[:description]
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