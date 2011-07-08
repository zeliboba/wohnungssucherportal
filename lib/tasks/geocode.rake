namespace :geocode do
  
  desc "Geocode all flats with the gmaps4rails gem, simply by saving them once."
  task :flats => :environment do
      Flat.all.each do |f| 
        begin
          puts "Geocoding #{f.street} ... "
          f.save!
        rescue => e
          puts "error, data:"
          puts f.inspect
          puts e.inspect
          next
        ensure
          sleep(0.5)
        end
        puts "=> lat #{f.latitude} lon #{f.longitude}"
      end
  end
  
end