require 'open-uri'
require 'hpricot'
require 'htmlentities'

class PageScraper

  class << self

    def scrape(url)
      hpricot_doc = open(url) { |f| Hpricot(f) }
      scraper = find_scraper(url)
      scraper.from_hpricot(hpricot_doc, url)
    end

    private
  
      # meh.
      def find_scraper(url)
        return WGGesuchtPageScraper if url.include?("wg-gesucht.de")
        return Immobilienscout24PageScraper if url.include?("immobilienscout24.de")
        raise "No known scraper for URLs like #{url}"
      end
      
      def decode_html_entities(string)
        HTMLEntities.new.decode(string)
      end
      
  end
  
end