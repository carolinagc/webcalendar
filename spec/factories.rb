FactoryGirl.define do
  factory :calendar do
    title "A calendar title"
    user
  end

  factory :event do
    name "A specific event"
    event_type "Whatever"
    startdatetime Date.today
    public false
  end

  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    name "Test User"
    password "foolalala"
    password_confirmation "foolalala"
    email
    confirmed_at Time.now
  end

  factory :organizer do
    name "MTS"
    description "An intergalacic space"
  end

  factory :location do
    name "c-base"
    address "somewhere 23"
  end

  factory :tag do
    name "Maker"
  end
end
