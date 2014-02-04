require 'spec_helper'

describe Event do
  before do
    @calendar = FactoryGirl.build(:calendar)
    @event = FactoryGirl.build(:event, calendar: @calendar)
  end

  it "should have a name" do
    expect(@event.name).to be_present
  end

  it "should be invalid without a name" do
    expect(Event.new).to be_invalid
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

  it "should be part of a calendar" do
    expect(@event.calendar).to eq(@calendar)
  end

  it "should be invalid without a calendar" do
    @event.calendar = nil
    expect(@event).to be_invalid
  end
end

