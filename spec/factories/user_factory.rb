FactoryGirl.define do
  factory :user do
    sequence(:email) { |nr| "email_#{nr}@phillipoertel.com" }
    password "hello-world"
  end
end
