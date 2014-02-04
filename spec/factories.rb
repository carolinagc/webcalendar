FactoryGirl.define do
  factory :calendar do
    title "A random calendar"
  end

  factory :event do
    name "A specific event"
    event_type "Whatever"
    startdatetime Date.today
    calendar_id 1
  end

  factory :user do
    name "Test User"
    password "foolalala"
    password_confirmation "foolalala"
    email "test@example.com"
    confirmed_at Time.now
  end
end
