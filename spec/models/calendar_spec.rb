require 'spec_helper'

describe Calendar do
  before do
    create_calendar
  end

  it "should have a user" do
    expect(@calendar.user).to eq(@user)
  end

  it "should have a title" do
    expect(@calendar).to respond_to(:title)
  end

  it "should have a proper url"
  it "should be anonymous by default"

  context "with events" do
    before do
      create_events
    end

    it "should have events" do
      events = Event.where(calendar: @calendar)
      expect(events.size).to be(2)
    end
  end

  context "which is anonymous" do
    it "should not have a user"
  end

  def create_events
    @events = []
    2.times do
      @events << Event.create(name: "An Event", event_type: "Workshop", startdatetime: Date.today, calendar: @calendar)
    end
  end

  def create_calendar
    @user = User.new(:name => 'julia', :email=> 'julia@lala.com',
              :password => 'foolalala', :password_confirmation => 'foolalala',             :confirmed_at => Time.now )
    @calendar = Calendar.create(url: "url", title: "test", user: @user)
  end
end
