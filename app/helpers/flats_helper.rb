module FlatsHelper
  def available_months(flat)
    return "unlimited" unless flat.available_months
    "#{flat.available_months} month#{flat.available_months == 1 ? '' : 's'}"
  end
end
