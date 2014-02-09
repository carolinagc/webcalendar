# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :calendar do
    title "MyString"
    user

    factory :calendar_with_events do
      after(:create) do |calendar|
        FactoryGirl.create_list(:event, 2, calendar: calendar)
      end
    end
  end
end
