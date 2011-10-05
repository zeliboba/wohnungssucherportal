class FavoritePlace < ActiveRecord::Base

  validates_presence_of :street, :city
  
  # FIXME it would be better to stub the request and have it run, than to prevent it completely
  acts_as_gmappable(:process_geocoding => false)

  def full_address
    [street, city, country].join(", ")
  end
  alias :gmaps4rails_address :full_address
  
  def country
    "Deutschland"
  end
  
end
