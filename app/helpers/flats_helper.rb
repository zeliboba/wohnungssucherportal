module FlatsHelper
  def available_months(flat)
    return "unlimited" unless flat.available_months
    "#{flat.available_months} month#{flat.available_months == 1 ? '' : 's'}"
  end
  
  def flats_data_for_client(flats)
    flats.map do |flat|
      {:address => flat.full_address, :dbId => flat.id}
    end
  end
end
