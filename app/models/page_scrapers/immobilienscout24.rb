class PageScraper::Immobilienscout24 < PageScraper

  scrapes 'immobilienscout24.de'

  class << self

    # http://www.immobilienscout24.de/54848774?is24EC=IS24&ftc=8024LOGXXUA&_s_cclid=1269083509
    def from_hpricot(doc, url)
      flat = {}
      flat[:url] = url
      flat[:state] = Flat::STATES.first
      
      tds   = doc.search("//td").select { |td| td.inner_html == "Zimmer:" }

      rooms_as_string = tds.first.following_siblings[0].inner_html
      flat[:rooms] = rooms_as_string.gsub(',', '.').to_f
      
      flat
    end

  end
  
end
