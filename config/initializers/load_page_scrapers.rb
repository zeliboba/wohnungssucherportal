# hack before fixing the load problem of the scraper classes

require 'page_scraper'
Dir.glob(File.join(Rails.root, 'app/models/page_scraper/*.rb')).each { |f| require f }
