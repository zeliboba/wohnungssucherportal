class Flat < ActiveRecord::Base
  
  include Flat::Options
  
  validates_presence_of :street, :square_meters, :price, :available_on, :priority, :user_id
  validates_numericality_of :square_meters, :price
  validates_length_of :subtitle, :maximum => 100
  
  # try preventing duplicates by only allowing one flat with same size and price per street
  validates_uniqueness_of :street, :scope => [:square_meters, :price], 
    :message => "There's already a flat in this street with same size and price."
  
  validate :available_until_must_be_after_available_on
  validates_inclusion_of :state, :in => STATES, :allow_nil => true
  
  scope :for_index, :conditions => [
    # created_at is to exclude legacy flats, can be removed when user accounts are added and associated with flats
    "state NOT IN('i_rejected', 'not_available') AND created_at >= '2011-01-01'"
  ]
  
  scope :ordered, lambda { |*order|
    { :order => order.flatten.first || SORT_OPTIONS.first[1] }
  }

  scope :have_visits, where(['visit_at IS NOT NULL']).order('visit_at DESC')
  
  belongs_to :user
  
  # FIXME it would be better to stub the request and have it run, than to prevent it completely
  acts_as_gmappable(:process_geocoding => !Rails.env.test?)
  
  def square_meter_price
    ((price / square_meters.to_f) * 100).round / 100.to_f
  end
  
  def full_address
    city_with_postal = postal_code ? "#{postal_code} #{city}" : city
    [street, city_with_postal, country].join(", ")
  end
  alias :gmaps4rails_address :full_address
  
  def available_months
    return unless available_until
    ((available_until - available_on).to_i) / 30
  end
  
  # flats can be entered manually or be created from a scraped url
  def scraped?
    !url.blank?
  end
  
  def visit_passed?
    visit_at < Time.now
  end
  
  def city
    "München"
  end
  
  def country
    "Deutschland"
  end
  
  class << self
    
    def from_url(url)
      attributes = PageScraper.scrape(url).attributes
      Flat.new(attributes.merge(:url => url))
    end

    private
    
      def decode_html_entities(string)
        require 'htmlentities'
        HTMLEntities.new.decode(string)
      end
    
  end
  
  private 
  
    def available_until_must_be_after_available_on
      return true unless available_until
      if ((available_until - available_on).to_i) <= 1
        errors.add(:base, 'Avail until must be after avail on.')
      end
    end

end
