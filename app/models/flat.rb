class Flat < ActiveRecord::Base
  
  STATES = %w(
    interesting
    contacted
    visit_scheduled
    i_rejected
    not_available
  )
  
  # should not be in model
  SORT_OPTIONS = {
    'street' => 'street ASC',
    'added' => 'created_at DESC',
    'm²' => 'square_meters DESC',
    'price' => 'price DESC',
    'cost' => 'price/square_meters DESC',
    'available on' => 'available_on ASC'
  }
  
  has_many :notes, :order => 'created_at DESC'
  
  validates_presence_of :street, :neighbourhood, :rooms, :square_meters, :price, :available_on, :url
  validates_numericality_of :rooms, :square_meters, :price
  validates_uniqueness_of :street
  validate :available_until_must_be_after_available_on
  validates_inclusion_of :state, :in => STATES, :allow_nil => true
  
  named_scope :for_index, :conditions => ["state IN(NULL, 'new', 'interesting', 'contacted', 'visit_scheduled')"]
  named_scope :ordered, lambda { |*order|
    { :order => order.flatten.first || 'priority ASC, square_meters DESC' }
  }
  named_scope :expired, :conditions => { :state => 'not_available' }
  
  def square_meter_price
    ((price / square_meters.to_f) * 100).round / 100.to_f
  end
  
  def full_address
    "#{street}, #{neighbourhood}, Berlin, Germany"
  end
  
  def available_months
    return unless available_until
    ((available_until - available_on).to_i) / 30
  end
  
  class << self
    
    def from_url(url)
      attributes = PageScraper.scrape(url)
      Flat.new(attributes)
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
        errors.add_to_base('Avail until must be after avail on.')
      end
    end
end
