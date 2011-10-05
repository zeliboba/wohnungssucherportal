require 'spec_helper'

describe FavoritePlace do
  describe "Full address formatting" do
    it "works with postal code" do
      place = Factory.build(:favorite_place)
      assert_equal 'Marcel-Breuer-Straße 12, München, Deutschland', place.full_address
    end
  end  
  
end
