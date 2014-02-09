require 'spec_helper'

describe Event do
  before :each do
    @calendar = FactoryGirl.create(:calendar_with_events)
    @event = @calendar.events.first
  end

  it "should have a name" do
    expect(@event.name).to be_present
  end

  it "should be invalid without a name" do
    expect(Event.new).to be_invalid
  end

  it "should belong to a calendar" do
    expect(@event.calendar).to eq(@calendar)
  end

  it "should be invalid without a calendar" do
    @event.calendar = nil
    expect(@event).to be_invalid
  end

  it "should have a startdatetime" do
    expect(@event.startdatetime).to be_present
  end

  it 'should have a duration' do
    expect(@event.duration).to be_present
  end

  it 'should return an end time' do
    expect(@event.enddatetime).to be_present
  end

  it 'should return the correct end time' do
    @event.duration = 2.hours
    expect(@event.enddatetime).to eq Date.today + 2.hours
  end

  it 'should have an event_type' do
    expect(@event.event_type).to be_present
  end

  it "is invalid without an event type" do
    @event.event_type = nil
    expect(@event).to be_invalid
  end

  it 'should have a location' do
    @location = FactoryGirl.build(:location)
    @event.location = @location
    expect(@event.respond_to?(:location)).to be_true
  end

  it 'should have an organizer' do
    @event.organizer = FactoryGirl.build(:organizer)
    expect(@event.respond_to?(:organizer)).to be_true
  end

  it 'should have a responsible of the event' do
    @event.responsible = "Anne"
    expect(@event.responsible).to be_present
  end

  it 'should be a private event by default' do
    expect(@event.public).to be_false
  end

  it 'should be a public event' do
    @event.public = true
    expect(@event.public).to be_true
  end

  describe ".public" do
    it "should return only public events" do
      public_event = FactoryGirl.create(:public_event, calendar: @calendar)
      private_event = FactoryGirl.create(:private_event, calendar: @calendar)
      expect(Event.public).to include(public_event)
      expect(Event.public).not_to include(private_event)
    end
  end

  describe ".ordered_by_start" do
    it "should return events ordered by startdatetime" do
      event2 = FactoryGirl.create(:event, startdatetime: 2.days.from_now, calendar: @calendar)
      event1 = FactoryGirl.create(:event, startdatetime: 1.days.from_now, calendar: @calendar)
      expect(Event.ordered_by_start.first.startdatetime).to be > Event.ordered_by_start.last.startdatetime
    end
  end
end

