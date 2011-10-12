FactoryGirl.define do
  factory :flat do
    sequence(:street, 42) { |nr| "Kazmairstraße #{nr}" }
    neighbourhood "Westend"
    postal_code "12345"
    city "München"
    square_meters "25"
    price "300"
    available_on Time.parse("2011-08-01")
    priority Flat::DEFAULT_PRIORITY
    state Flat::STATES[0]
    # prevent geocoding of new records in tests
    latitude 48.1672
    longitude 11.5748
    gmaps 1
    user
    subtitle "Mr Lodge, ****"
  end
end