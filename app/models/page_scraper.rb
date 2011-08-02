require 'open-uri'
require 'hpricot'
require 'htmlentities'

class PageScraper

  attr_reader :attributes

  class << self

    def scrape(url)
      anti_anti_scrape_headers = { 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:5.0) Gecko/20100101 Firefox/5.0"}
      hpricot_doc = open(url, anti_anti_scrape_headers) { |f| Hpricot(f) }
      find_scraper(url).new(hpricot_doc, url)
    end

    private
    
      # used in the child classes to register as scraper for a domain
      def scrapes(domain)
        @@scraper_registry ||= {}
        @@scraper_registry[domain] = self
      end
      
      def find_scraper(url)
        @@scraper_registry.find { |domain, scraper| url.include?(domain) }[1]
      end
      
  end
  
  protected
  
    def decode_html_entities(string)
      HTMLEntities.new.decode(string)
    end
  
end