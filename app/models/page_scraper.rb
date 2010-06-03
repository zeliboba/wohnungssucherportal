require 'open-uri'
require 'hpricot'
require 'htmlentities'
Dir.glob(File.join(Rails.root, 'app/models/page_scrapers/*.rb')).each { |f| require f }

class PageScraper

  class << self

    def scrape(url)
      hpricot_doc = open(url) { |f| Hpricot(f) }
      scraper = find_scraper(url).new
      scraper.from_hpricot(hpricot_doc, url)
    end

    private
    
      # used in the child classes to register as scraper for a domain
      def scrapes(domain)
        p "#{self} scrapes #{domain}"
        @@scraper_registry ||= {}
        @@scraper_registry[domain] = self
      end
      
      def find_scraper(url)
        @@scraper_registry.find { |domain, scraper| url.include?(domain) }[1]
      end
      
      def decode_html_entities(string)
        HTMLEntities.new.decode(string)
      end
      
  end
  
end