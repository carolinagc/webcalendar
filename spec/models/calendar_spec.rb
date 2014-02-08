require 'spec_helper'

describe Calendar do
  before :all do
    user = FactoryGirl.build(:user)
    @calendar = FactoryGirl.build(:calendar, user: user)
  end

  it "should be valid" do
    expect(@calendar).to be_valid
  end

  context "with events" do
    before :each do
      @events = FactoryGirl.create_list(:event, 2, calendar: @calendar)
    end

    it "should have events" do
      expect(@calendar.events.size).to be(2)
    end
  end
end
