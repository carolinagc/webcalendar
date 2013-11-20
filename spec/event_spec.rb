require 'spec_helper'

describe Event do
  before :each do
    @event = Event.new(:name => "Printing the washing machine", :event_type => "Workshop", :day => Date.today)
  end

  it "should name be presente" do
    @event.name.should be_present
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
    @event.should be_present 
  end
  
  it  'should have an event_type' do
    @event.event_type.should be_present
  end
  it "is invalid without a event_type" do
    @event1 = Event.new
    @event1.should_not be_valid
  end

end

