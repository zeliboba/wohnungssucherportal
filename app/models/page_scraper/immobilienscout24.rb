class PageScraper::Immobilienscout24 < PageScraper

  scrapes 'immobilienscout24.de'

  # http://www.immobilienscout24.de/54848774?is24EC=IS24&ftc=8024LOGXXUA&_s_cclid=1269083509
  def initialize(doc, url)
    @attributes = {}
    @attributes[:url] = url
    @attributes[:state] = Flat::STATES.first
    
    tds   = doc.search("//td").select { |td| td.inner_html == "Zimmer:" }

    rooms_as_string = tds.first.following_siblings[0].inner_html
    @attributes[:rooms] = rooms_as_string.gsub(',', '.').to_f
  end

end
