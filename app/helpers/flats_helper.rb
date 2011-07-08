module FlatsHelper
  def available_months(flat)
    return "unlimited" unless flat.available_months
    "#{flat.available_months} month#{flat.available_months == 1 ? '' : 's'}"
  end
  
  def flats_as_json(flats)
    # to_json double encodes stuff and then google maps can't locate some addresses
    # FIXME revert to #to_json once db encoding is fixed
    inner = flats.map do |flat|
      %({"address": "#{flat.full_address}", "dbId": "#{flat.id}"})
    end.join(",\n")
    "[ #{inner} ]"
  end
end
