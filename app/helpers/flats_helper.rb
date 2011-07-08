module FlatsHelper
  def available_months(flat)
    return "unlimited" unless flat.available_months
    "#{flat.available_months} month#{flat.available_months == 1 ? '' : 's'}"
  end
  
  def flats_as_json(flats)
    flats.map do |flat|
      {:address => flat.full_address, :dbId => flat.id}
    end.to_json
  end
end
