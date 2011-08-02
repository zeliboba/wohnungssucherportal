class PageScraper::WGGesucht < PageScraper

  scrapes 'wg-gesucht.de'
  
  def initialize(doc, url)
    @doc = doc
    @attributes = {}
    @attributes[:url] = url
    @attributes[:state] = Flat::STATES.first

    @attributes[:neighbourhood] = parse_neighbourhood
    @attributes[:street]        = parse_street
    @attributes[:title]         = parse_title

    @attributes[:price]         = parse_total_price
    @attributes[:square_meters] = parse_square_meters
    @attributes[:available_on], @attributes[:available_until] = parse_dates
    # is not reliable
    #@attributes[:rooms]         = parse_rooms
  end

  def parse_total_price
    td = blue_box.search('//td').find { |td| td.inner_html =~ /&euro/ }
    td.inner_html.gsub(/[^0-9]/, '').to_i
  end

  def parse_square_meters
    td = blue_box.search('//td').find { |td| td.inner_html =~ /m&sup2/ }
    td.at("b").inner_html.gsub('m&sup2', '').to_i
  end

  # returns start and end date. 
  # the end date is nil if wohnung is "unbefristet".
  def parse_dates
    # find date fields
    dates = blue_box.search('//b').map(&:inner_html).select do |tag| 
      tag =~ /\d{2}.\d{2}.\d{4}/
    end
    # convert to ruby dates
    dates.map! do |string|
      d, m, y = string.split(".").map(&:to_i)
      Date.civil(y, m, d)
    end
    # if there's only one date in the tags, time ist unbefristet
    # if there are two, it's befristet, and the more recent date is the start date
    dates << nil if dates.size == 1
    dates
  end

  def parse_title
    title = @doc.search("//div[@class='headlineDarkorangeInside']//b").inner_html
    decode_strip(title)
  end

  def parse_neighbourhood
    tds = ang_detail_box.search("//td")
    neighbourhood = tds[1].inner_html.match(/<b>(.+?)<\/b>/)[1].gsub(/<\/?[^>]*>/, "")
    decode_strip(neighbourhood)
  end

  def parse_street
    tds = ang_detail_box.search("//td")
    decode_strip(tds[2].inner_html.split("<b")[0])
  end

  def parse_rooms
    rooms = blue_box.search('//b').last.inner_html.gsub(/[^0-9]/, '').to_i
    decode_strip(rooms)
  end

  private 

    # this is the blue box with "Zimmergröße", "Gesamtmiete", etc. in it.
    def blue_box
      @blue_box ||= @doc.search("//div[@class='headlineLightblueInside']")
    end
    
    def ang_detail_box
      @ang_detail_box ||= @doc.search('//td[@class="detailPaddingCell ang_detail_box"]')
    end
    
    def decode_strip(string)
      decode_html_entities(string).strip
    end
  
end