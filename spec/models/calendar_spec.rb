require 'spec_helper'

describe Calendar do
  before :each do
    create_calendar
  end

  it "should have a user" do
    expect(@calendar.user).to eq(@user)
  end

  it "should have a title" do
    expect(@calendar).to respond_to(:title)
  end

  it "should have a proper url" do
    pending "Figure out how to do this"
  end

  context "with events" do
    before :each do
      @events = FactoryGirl.create_list(:event, 2, calendar: @calendar)
    end

    it "should have events" do
      events = Event.where(calendar: @calendar)
      expect(events.size).to be(2)
    end
  end

  context "which is anonymous" do
    it "should not have a user"
  end

  def create_calendar
    @user = FactoryGirl.build(:user)
    @calendar = FactoryGirl.build(:calendar, user: @user)
  end
end
