require 'spec_helper'

describe PageScraper::WGGesucht do

  it "parses basic attributes from given HTML page" do
    url = "http://www.wg-gesucht.de/my_url"
    flat = PageScraper::WGGesucht.from_hpricot(hpricot_doc_for('neue-bahnhofstrasse'), url)
    assert_equal url, flat[:url]
    assert_equal Flat::STATES.first, flat[:state]
    
    assert_equal 18, flat[:square_meters]
    assert_equal Date.parse("06.07.2011"), flat[:available_on]
    assert_equal 303, flat[:price]    
    assert_equal "Friedrichshain", flat[:neighbourhood]
    assert_equal "Neue Bahnhofstr. 33", flat[:street]
  end
  
  private
  
    def hpricot_doc_for(file)
      open(File.join(File.dirname(__FILE__), "/test_data/#{file}.html")) { |f| Hpricot(f) }
    end
  
end