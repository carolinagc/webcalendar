require 'spec_helper'

describe Calendar do
  before :each do
    @calendar = FactoryGirl.create(:user_with_calendar_with_events).calendars.first
  end

  it "should be valid" do
    expect(@calendar).to be_valid
  end

  it "should be invalid without a user" do
    @calendar.user = nil
    expect(@calendar).to be_invalid
  end

  it "should be invalid without a title" do
    @calendar.title = nil
    expect(@calendar).to be_invalid
  end

  context "with events" do
    it "should have events" do
      expect(@calendar.events.size).to be(2)
    end
  end
end
