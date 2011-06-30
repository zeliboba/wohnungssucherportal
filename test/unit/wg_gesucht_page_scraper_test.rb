require File.join(File.dirname(__FILE__), '../test_helper')

class WGGesuchtPageScraperTest < ActiveRecord::TestCase

  test "from_hpricot for kommune flat" do
    url = "http://www.wg-gesucht.de/my_url"
    flat = PageScraper::WGGesucht.from_hpricot(hpricot_doc_for('kommune'), url)
    assert_equal url, flat.url
    assert_equal Flat::STATES.first, flat.state
    
    assert_equal 85, flat.square_meters
    assert_equal Date.parse("15.03.2010"), flat.available_on
    assert_equal 730, flat.price
    assert_equal 2, flat.rooms
    assert_equal "Schöne 2-Zimmer-Wohnung mit großer Wohnkücke", flat.title
    
    assert_equal "Friedrichshain", flat.neighbourhood
    assert_equal "Strasse der Pariser Kommune 37", flat.street
  end
  private
  
    def hpricot_doc_for(file)
      open(File.join(Rails.root, "test/unit/test_data/#{file}.html")) { |f| Hpricot(f) }
    end
  
end