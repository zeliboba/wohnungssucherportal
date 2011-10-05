FactoryGirl.define do
  factory :favorite_place do
    street "Marcel-Breuer-Straße 12"
    city "München"
    # prevent geocoding of new records in tests
    latitude 48.1672
    longitude 11.5748
    gmaps 1
  end
end
