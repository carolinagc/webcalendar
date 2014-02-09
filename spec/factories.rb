FactoryGirl.define do
  factory :event do
    name "A specific event"
    event_type "Whatever"
    startdatetime Date.today

    trait :public do
      public true
    end

    trait :private do
      public false
    end

    factory :public_event, traits: [:public]
    factory :private_event, traits: [:private]
  end

  factory :user do
    name "Test User"
    password "foolalala"
    password_confirmation "foolalala"
    email "test@example.com"
    confirmed_at Time.now

    factory :user_with_calendar do
      after(:create) do |user|
        FactoryGirl.create(:calendar, user: user)
      end
    end

    factory :user_with_calendar_with_events do
      after(:create) do |user|
        FactoryGirl.create(:calendar_with_events, user: user)
      end
    end
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
