require 'test_helper'

class WGGesuchtFlatParserTest < ActiveRecord::TestCase

  test "from_hpricot for kommune flat" do
    url = "http://www.wg-gesucht.de/my_url"
    flat = WGGesuchtFlatParser.from_hpricot(hpricot_doc_for('kommune'), url)
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
  
  test "from_hpricot for erich weinert flat" do
    url = "http://www.wg-gesucht.de/my_url"
    flat = WGGesuchtFlatParser.from_hpricot(hpricot_doc_for('erich-weinert-strasse'), url)
    assert_equal url, flat.url
    assert_equal Flat::STATES.first, flat.state
    
    assert_equal 61, flat.square_meters
    assert_equal Date.parse("01.03.2010"), flat.available_on
    assert_equal 585, flat.price
    assert_equal 2, flat.rooms
    assert_equal "schöne helle Altbauwohnung", flat.title
    
    assert_equal "Prenzlauer Berg", flat.neighbourhood
    assert_equal "Erich-Weinert-Straße 128", flat.street
  end
  
  test "from_hpricot for gleimstraße flat" do
    url = "http://www.wg-gesucht.de/my_url"
    flat = WGGesuchtFlatParser.from_hpricot(hpricot_doc_for('gleimstrasse'), url)
    assert_equal url, flat.url
    assert_equal Flat::STATES.first, flat.state
    
    assert_equal 65, flat.square_meters
    assert_equal Date.parse("01.04.2010"), flat.available_on
    assert_equal 773, flat.price
    assert_equal 2, flat.rooms
    assert_equal "Schöne Wohnung -Schöne Ecke", flat.title
    
    assert_equal "Prenzlauer Berg", flat.neighbourhood
    assert_equal "Gleimstraße 40", flat.street
  end
  
  test "from_hpricot for kopenhagener strasse flat" do
    url = "http://www.wg-gesucht.de/my_url"
    flat = WGGesuchtFlatParser.from_hpricot(hpricot_doc_for('kopenhagenerstrasse'), url)
    assert_equal url, flat.url
    assert_equal Flat::STATES.first, flat.state
    
    assert_equal 76, flat.square_meters
    assert_equal Date.parse("01.04.2010"), flat.available_on
    assert_equal 795, flat.price
    assert_equal 2, flat.rooms
    assert_equal "2-Zi.Whg. zwischen Schönhauser Allee u. Mauerpark", flat.title
    
    assert_equal "Prenzlauer Berg", flat.neighbourhood
    assert_equal "Kopenhagener Str. 48", flat.street
  end
  
  private
  
    def hpricot_doc_for(file)
      open(File.join(Rails.root, "test/unit/test_data/#{file}.html")) { |f| Hpricot(f) }
    end
  
end