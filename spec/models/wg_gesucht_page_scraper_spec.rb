require 'spec_helper'

describe "it parses shared flats" do

  before(:all) do
    @url = "http://www.wg-gesucht.de/my_url"
    @flat = PageScraper::WGGesucht.from_hpricot(hpricot_doc_for('occamstrasse'), @url)
  end
  
  it "stores basic attributes in the flat model" do
    assert_equal @url, @flat[:url]
    assert_equal Flat::STATES.first, @flat[:state]
  end
  
  it "parses square_meters" do
    assert_equal 12, @flat[:square_meters]
  end
  
  it "parses dates" do
    assert_equal Date.parse("01.08.2011"), @flat[:available_on]
    assert_equal Date.parse("30.09.2011"), @flat[:available_until]
  end
  
  it "parses price" do
    assert_equal 320, @flat[:price]      
  end
  
  it "parses neighbourhood" do
    assert_equal "Schwabing-West", @flat[:neighbourhood]    
  end
  
  it "parses street" do
    assert_equal "Occamstr 21", @flat[:street]
  end    
  
  private
  
    def hpricot_doc_for(file)
      open(File.join(File.dirname(__FILE__), "/test_data/#{file}.html")) { |f| Hpricot(f) }
    end
  
end

describe "it parses additional info on solo flats" do
  
end