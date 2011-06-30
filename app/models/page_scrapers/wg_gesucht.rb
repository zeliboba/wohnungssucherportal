class PageScraper::WGGesucht < PageScraper

  scrapes 'wg-gesucht.de'

  class << self

    # http://www.wg-gesucht.de/wohnungen-in-Berlin-Prenzlauer-Berg.1994279.html
    def from_hpricot(doc, url)
      flat = {}
      flat[:url] = url
      flat[:state] = Flat::STATES.first

      flat = flat.merge(parse_data_table(doc))
      
      left_align_tables    = doc.search('//table[@align="left"]//td')
      flat[:neighbourhood] = decode_html_entities(left_align_tables[1].inner_html.match(/<b>(.+?)<\/b>/)[1].gsub(/<\/?[^>]*>/, "")).strip
      flat[:street]        = decode_html_entities(left_align_tables[2].inner_html.split("<b")[0]).strip
      flat
    end
    
    def parse_data_table(doc)
      returning({}) do |data|
        data[:price], data[:square_meters] = parse_price_and_size(doc)
        b_gross = doc.search("//b[@class='gross']")
        data[:available_on], data[:available_until] = parse_dates(b_gross)
        #data[:rooms] = b_gross.last.inner_html.gsub(/[^0-9]/, '').to_i
      end
    end
    
    # FIXME this is a more reliable way to get the fields, use it
    # for the available_until and available_on fields.
    def parse_price_and_size(doc)
      tds   = doc.search("//div[@class='headlineLightblueInside']").search("//td")
      p tds
      price = parse_total_price(tds)
      p price
      size  = parse_size(tds)
      p size
      [price, size]
    end
    
    def parse_total_price(tds)
      td = tds.find { |td| td.inner_html =~ /&euro/ }
      td.inner_html.gsub(/[^0-9]/, '').to_i
    end
    
    def parse_size(tds)
      td = tds.find { |td| td.inner_html =~ /m&sup2/ }
      td.at("b").inner_html.gsub('m&sup2', '').to_i
    end
    
    # returns start and end date. end date is nil if wohnung unbefristet.
    def parse_dates(bold_tags)
      # find date fields
      dates = bold_tags.map(&:inner_html).select do |tag| 
        tag =~ /\d{2}.\d{2}.\d{4}/
      end
      # convert them to ruby date instances
      dates.map! do |string|
        d, m, y = string.split(".").map(&:to_i)
        Date.civil(y, m, d)
      end
      # if there's only one date in the tags, time ist unbefristet
      # if there are two, it's befristet, and the more recent date is the start date
      dates << nil if dates.size == 1
      dates
    end
    
  end
  
end