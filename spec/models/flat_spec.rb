require 'spec_helper'

describe Flat do
  it "square_meter_price calculation returns integer", :type => :smoke do
    flat = Factory.build(:flat, :square_meters => 60, :price => 600)
    assert_equal 10, flat.square_meter_price
  end

  it "square_meter_price calculation returns float" do
    flat = Factory.build(:flat, :square_meters => 60, :price => 700)
    assert_equal 11.67, flat.square_meter_price
  end
  
  describe "Full address formatting" do
    it "works with postal code" do
      flat = Factory.build(:flat, :street => 'Kazmairstraße 42')
      assert_equal 'Kazmairstraße 42, 12345 München, Deutschland', flat.full_address
    end

    it "works without postal code" do
      flat = Factory.build(:flat, :street => 'Kazmairstraße 42', :postal_code => nil)
      assert_equal 'Kazmairstraße 42, München, Deutschland', flat.full_address
    end

    it "works using the alias for gmaps4rails" do
      flat = Factory.build(:flat, :street => 'Kazmairstraße 42')
      assert_equal 'Kazmairstraße 42, 12345 München, Deutschland', flat.gmaps4rails_address
    end

  end
  
  it "available one month" do
    flat = Factory.build(:flat, :available_on => Date.parse("01.11.2009"), :available_until => Date.parse("01.12.2009"))
    assert_equal 1, flat.available_months
  end
  
  it "available three months" do
    flat = Factory.build(:flat, :available_on => Date.parse("01.11.2009"), :available_until => Date.parse("01.02.2010"))
    assert_equal 3, flat.available_months
  end
  
  it "available months is nil when flat rent has no end date" do
    flat = Factory.build(:flat, :available_on => Date.parse("01.11.2009"))
    assert_equal nil, flat.available_months
  end
  
  it "availability must be sane -- start date is after end date" do
    flat = Factory.build(:flat, :available_on => Date.parse("01.11.2009"), :available_until => Date.parse("01.10.2009"))
    assert_equal false, flat.valid?
    assert_not_equal [], flat.errors[:base]
  end
  
  describe "State changes" do    
    it "the status changes to 'visit scheduled' when a visit date is entered", :pending do
      flat = Factory.create(:flat, :visit_at => nil)
      flat.visit_at = Time.now + 1.week
      flat.save!
      flat.state.should == 'visit_scheduled'
    end
    it "the status doesn't change when visit date isn't changed" do
      flat = Factory.create(:flat, :visit_at => nil)
      flat.save!
      flat.state.should == "new"
    end
    it "the status doesn't change when visit date isn't changed to nil" do
      flat = Factory.create(:flat, :visit_at => Time.now + 1.day)
      flat.visit_at = nil
      flat.state = "contacted"
      flat.save!
      flat.state.should == "contacted"
    end
    it "should allow changing out of status visit_scheduled when ", :pending
  end
end
