require 'spec_helper'

describe Event do
  before :each do
    @event = Event.new(:name => "Printing the washing machine", :event_type => "Workshop", :day => Date.today)
  end

  it "should name be presente" do
    expect(@event.name).to be_present
  end

  it "is invalid without a name" do
    @event1= Event.new
    @event1.should_not be_valid
  end

  it "should have a day" do
    @event.day = Date.today
    @event.should be_present
  end
  
  it 'should have a time' do 
    @event.time = Time.now
    @event.time.should be_present 
  end
  
  it  'should have an event_type' do
    expect(@event_type).not_to be_present
  end
  it "is invalid without a event_type" do
    @event1 = Event.new
    expect(@event1).not_to be_valid
  end

  it 'should have a location' do
    @location = Location.create(:name => 'c-base', :address => 'somewhere 23')
    @event.location = @location
    expect(@event.respond_to?(:location)).to be_true
  end

  it 'should have an organizer' do
    @organizer = Organizer.create(:name => 'MTS')
    @event.organizer = @organizer    
    expect(@event.respond_to?(:organizer)).to be_true
  end

end

