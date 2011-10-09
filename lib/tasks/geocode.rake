namespace :geocode do

  def geocode_place(place)
    begin
      puts "Geocoding #{place.street} ... "
      place.save!
    rescue => e
      puts "error, data:"
      puts place.inspect
      puts e.inspect
      next
    ensure
      sleep(0.5)
    end
    puts "=> lat #{place.latitude} lon #{place.longitude}"
  end
  
  desc "Geocode all flats with the gmaps4rails gem, simply by saving them once."
  task :flats => :environment do
    Flat.all.each { |place| geocode_place(place) }
  end
  
  desc "Geocode all favorite places with the gmaps4rails gem, simply by saving them once."
  task :favorite_places => :environment do
    FavoritePlace.all.each { |place| geocode_place(place) }
  end
  
end