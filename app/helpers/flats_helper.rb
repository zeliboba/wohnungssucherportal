module FlatsHelper
  def available_months(flat)
    return "unlimited" unless flat.available_months
    "#{flat.available_months} month#{flat.available_months == 1 ? '' : 's'}"
  end
  
  def flats_as_json(flats)
    flats.map do |flat|
      {:full_address => flat.full_address, :id => flat.id, 
        :latitude => flat.latitude, :longitude => flat.longitude }
    end.to_json
  end
end
