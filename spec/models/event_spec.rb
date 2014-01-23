require 'spec_helper'

describe Event do
 
  it "should name be presente" do
    create_an_event  
  expect(@event.name).to be_present
  end

  it "is invalid without a name" do
    @event1= Event.new
    @event1.should_not be_valid
  end

  it "should have a startdatetime" do
    create_an_event
    @event.startdatetime = Date.today
    @event.should be_present
  end
  
  it 'should have a duration' do 
    create_an_event
    @event.duration.should be_present 
  end

  it 'should return an end time' do
    create_an_event
    @event.enddatetime.should be_present
  end

  it 'should return the correct end time' do
    create_an_event
    @event.startdatetime = Date.today
    @event.duration = 2.hours
    expect(@event.enddatetime).to eq Date.today + 2.hours
  end
  
  it  'should have an event_type' do
    create_an_event
    expect(@event_type).not_to be_present
  end
  it "is invalid without a event_type" do
    @event1 = Event.new
    expect(@event1).not_to be_valid
  end

  it 'should have a location' do
    create_an_event
    @location = Location.create(:name => 'c-base', :address => 'somewhere 23')
    @event.location = @location
    expect(@event.respond_to?(:location)).to be_true
  end

  it 'should have an organizer' do
    create_an_event
    @organizer = Organizer.create(:name => 'MTS')
    @event.organizer = @organizer    
    expect(@event.respond_to?(:organizer)).to be_true
  end

  it 'should have a responsible of the event' do
    create_an_event
    @event.responsible = "Anne"
    @event.responsible.should be_present
  end

  it 'should be a private event by default' do
    create_an_event
    @event.public.should_not be_true
  end

  it 'should be a public event' do
    create_an_event
    @event.public = true
    @event.public.should be_true
  end

  def create_an_event
    @event = Event.new(:name => "Printing the washing machine", :event_type => "Workshop", :startdatetime => Date.today)
  end

end

