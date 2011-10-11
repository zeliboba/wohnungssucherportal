class FavoritePlace < ActiveRecord::Base

  validates_presence_of :street, :city
  belongs_to :user
  
  # FIXME it would be better to stub the request and have it run, than to prevent it completely
  acts_as_gmappable(:process_geocoding => !Rails.env.test?)

  def full_address
    [street, city, country].join(", ")
  end
  alias :gmaps4rails_address :full_address
  
  def country
    "Deutschland"
  end
  
end
