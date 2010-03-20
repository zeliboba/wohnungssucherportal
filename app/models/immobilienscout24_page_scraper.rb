class Immobilienscout24PageScraper < PageScraper

  class << self

    # http://www.immobilienscout24.de/54848774?is24EC=IS24&ftc=8024LOGXXUA&_s_cclid=1269083509
    def from_hpricot(doc, url)
      flat = {}
      
      flat[:url] = url
      flat[:state] = Flat::STATES.first
      
      b_gross = doc.search("//b[@class='gross']")
      flat[:square_meters] = b_gross.first.inner_html.gsub('m&sup2', '').to_i
      flat[:available_on]  = Date.parse(b_gross[b_gross.size - 3].inner_html)
      flat[:price]         = b_gross[b_gross.size - 2].inner_html.gsub(/[^0-9]/, '').to_i
      flat[:rooms]         = b_gross.last.inner_html.gsub(/[^0-9]/, '').to_i
      
      div_inhalt = doc.search("//div[@class='inhalt']")
      flat[:title] = decode_html_entities(div_inhalt[0].children[1].inner_html).strip
      
      left_align_tables  = doc.search('//table[@align="left"]//td')
      flat[:neighbourhood] = decode_html_entities(left_align_tables[2].inner_html.match(/<b>(.+?)<\/b>/)[1].gsub(/<\/?[^>]*>/, "")).strip
      flat[:street]        = decode_html_entities(left_align_tables[3].inner_html.split("<b")[0]).strip
      
      images = doc.search("//img").each do |img|
        p img['src']
      end
      flat
    end

  end
  
end
