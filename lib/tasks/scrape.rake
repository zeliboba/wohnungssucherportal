# -*- coding: utf-8; mode: ruby; -*-

require 'mechanize'

namespace :scrape do
  desc "Scrape marktplaats.nl for data"
  task :marktplaats => :environment do
    url_base = "http://kopen.marktplaats.nl"
    distance = 50000 # m
    # FIXME: next settings should be take from user profile (see also below)
    city     = "Dordrecht"
    country  = "Netherlands"
    email    = "zeliboba@mail.ru"

    url = "#{url_base}/search.php?postcode=#{city}&distance=#{distance}&g=1032"
    puts "scrape from #{url}"
    agent = Mechanize.new
    agent.get("#{url}")
    agent.get(agent.page.search("a.txtBrowsePageAttributesList")[0][:href]) # Aangeboden
    agent.get(agent.page.search("span.bucketL2Item a")[0][:href]) # Huizen te huur
    puts "scrape from #{agent.page.uri}"
    # get the length of the rating from "XXX van YYY" string
    nPages = agent.page.search("td.paginatorActive a")[-2].text.to_i
    puts "there are #{nPages} pages to scrape"

    n = 1
    until n > nPages
      page = agent.page
      page.search("a.ad_list_link").each do |t|
        o = t.parent.parent.parent.parent
        flat_description = t.text
        flat_url = t[:href]
        flat_city  = o.css("td div.text_margin")[4].text.split(",")[0].strip
        flat_price = o.css("td div.text_margin")[1].text.strip.gsub(/[€ \.]/, "").to_i

        # create or modify with scraped data
        flat = Flat.find_or_create_by_url("#{flat_url}")
        flat.city = flat_city
        flat.price = flat_price
        flat.description = flat_description
        flat.square_meters = 0 # FIXME with additional scraper
        # check and set state
        flat.state = Flat::STATES.first if flat.state.nil?
        # fill in the requred fields with default data
        flat.available_on = Date.today
        flat.priority = 2 # 1 great, 2 ok, 3 so-so
        flat.user = User.find_by_email(email)        
        flat.country = country

        # avoid unnecessary validations on gmaps (there is query limit) if the
        # flat is already saved in the database and has an id
        if flat.id.nil?
        # save and display message
        if flat.save
          puts "done: #{flat.full_address}"
        else
          puts "fail: #{flat.full_address}"
          puts "      #{flat.url}"
          puts flat.errors.full_messages
        end
        sleep(1)
        else
          puts "flat #{flat.full_address} #{flat.id} exist"
        end

      end
      # go to next page
      puts "page #{n} done"
      n += 1
      p = page.search("td#paginator_cell_#{n}").at_css("a")
      agent.get("#{p[:href]}") if !p.nil?
    end

  end

  desc "Scrape funda.nl for data"
  task :funda => :environment do
    url_base = "http://funda.nl"
    distance = 15    # km
    minPrice = 0     # EUR
    maxPrice = 3000  # EUR
    rooms    = 2
    # FIXME: next settings should be take from user profile
    city     = "Dordrecht"
    country  = "Netherlands"
    email    = "zeliboba@mail.ru"

    url = "#{url_base}/huur/#{city}/+#{distance}km/#{minPrice}-#{maxPrice}/#{rooms}+kamers/3-dagen"
    puts "scrape from #{url}"
    agent = Mechanize.new
    agent.get("#{url}")
    # get the length of the rating as last element of the string
    nPages = agent.page.search(".paging-list").text.split[-1].to_i
    puts "there are #{nPages} pages to scrape"

    n = 1
    until n > nPages
      page = agent.page
      page.search("ul.object-list div.specs").each do |o|
        flat_street = o.at_css("h3 a").text.gsub(/[\*\.]$/, "").gsub(/[Hh][Uu][Uu][Rr]$/, "").strip
        flat_url    = o.at_css("h3 a")[:href]
        properties  = o.css("ul.properties-list li")
        location    = properties[0].child.text.split()
        # try to parse post code
        flat_postal_code   = nil
        flat_postal_code   = location.shift + " " if /\d{4}/   === location[0]
        flat_postal_code  += location.shift       if /^\w{2}$/ === location[0]
        # put the rest to the city
        flat_city          = location.join(" ")
        flat_square_meters = properties[1].css("[title='Woonoppervlakte']").text.to_i
        flat_rooms         = properties[1].css("[title='Aantal kamers']").text.to_i
        # price can contain range (to_i takes first), can have sell price
        # (always first hopefully), and thousands are delimited by dots
        price = o.css("span.price")
        flat_description = "sell price is" + o.css("span.price").first.text if price.count > 1
        flat_price = price.last.text.gsub(/[€ \.]/, "").to_i
        
        # create or modify with scraped data
        flat = Flat.find_or_create_by_street("#{flat_street}")
        flat.url = "#{url_base}" + flat_url
        flat.postal_code = flat_postal_code
        flat.city = flat_city
        flat.square_meters = flat_square_meters
        flat.rooms = flat_rooms
        flat.price = flat_price
        flat.description = flat_description
        # check and set state
        flat.state = Flat::STATES.first if flat.state.nil?
        # fill in the requred fields with default data
        flat.available_on = Date.today
        flat.priority = 2 # 1 great, 2 ok, 3 so-so
        flat.user = User.find_by_email(email)        
        flat.country = country

        # save and display message
        if flat.save
          puts "done: #{flat.full_address}"
        else
          puts "fail: #{flat.full_address}"
          puts "      #{flat.url}"
          puts flat.errors.full_messages
        end
        sleep(1)

      end
      # go to next page
      puts "page #{n} done"
      n += 1
      agent.get("#{url}/p#{n}")
    end

  end

  desc "Scrape everything for data"
  task :all => [:funda, :marktplaats]

end
