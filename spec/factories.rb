FactoryGirl.define do
  factory :event do
    name "A specific event"
    event_type "Whatever"
    startdatetime Date.today
  end

  factory :user do
    name "Test User"
    password "foolalala"
    password_confirmation "foolalala"
    email "test@example.com"
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
