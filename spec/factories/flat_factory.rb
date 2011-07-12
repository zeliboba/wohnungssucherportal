FactoryGirl.define do
  factory :flat do
    street "Kazmairstraße 42"
    neighbourhood "Westend"
    square_meters "25"
    price "300"
    available_on Time.parse("2011-08-01")
    priority Flat::DEFAULT_PRIORITY
    state Flat::STATES[0]
  end
end


__END__

OLD SYNTAX

Factory.sequence :email do |n|
  "email#{n}@example.com"
end

Factory.define :user do |factory|
  factory.name  { "Ron Burgundy" }
  factory.email { Factory.next(:email) }
end

Factory.define :admin, :parent => :user do |factory|
  factory.admin { true }
end

Factory.define :dog do |factory|
  factory.name { "Baxter" }
  factory.association(:owner, :factory => :user)
end

NEW SYNTAX

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user, :aliases => [:owner] do
    name "Ron Burgundy"
    email

    factory :admin do
      admin true
    end
  end

  factory :dog do
    name "Baxter"
    owner
  end
end