require 'spec_helper'

describe Flat do
  it "square_meter_price calculation returns integer" do
    flat = Flat.new(:square_meters => 60, :price => 600)
    assert_equal 10, flat.square_meter_price
  end

  it "square_meter_price calculation returns float" do
    flat = Flat.new(:square_meters => 60, :price => 700)
    assert_equal 11.67, flat.square_meter_price
  end
  
  it "full address" do
    flat = Flat.new(:street => 'Schlesische Straße 26')
    assert_equal 'Schlesische Straße 26, München, Deutschland', flat.full_address
  end
  
  it "available one month" do
    flat = Flat.new(:available_on => Date.parse("01.11.2009"), :available_until => Date.parse("01.12.2009"))
    assert_equal 1, flat.available_months
  end
  
  it "available three months" do
    flat = Flat.new(:available_on => Date.parse("01.11.2009"), :available_until => Date.parse("01.02.2010"))
    assert_equal 3, flat.available_months
  end
  
  it "available nine months" do
    flat = Flat.new(:available_on => Date.parse("01.11.2009"), :available_until => Date.parse("01.08.2010"))
    assert_equal 9, flat.available_months
  end
  
  it "available months is nil when flat rent has no end date" do
    flat = Flat.new(:available_on => Date.parse("01.11.2009"))
    assert_equal nil, flat.available_months
  end
  
  it "availability must be sane -- start date is after end date" do
    flat = Flat.new(:available_on => Date.parse("01.11.2009"), :available_until => Date.parse("01.10.2009"))
    assert_equal false, flat.valid?
    assert_not_equal [], flat.errors[:base]
  end
end
