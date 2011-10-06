module FlatsHelper
  def flats_as_json(flats)
    flats.map do |flat|
      {:full_address => flat.full_address, :id => flat.id, 
        :latitude => flat.latitude, :longitude => flat.longitude }
    end.to_json
  end
  
  def priority_as_number(flat)
    FlatDecorator.decorate(flat).priority
  end
end
