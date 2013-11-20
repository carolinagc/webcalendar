require 'spec_helper'

describe Event do
  before :each do
    @event = Event.new(:name => "Printing the washing machine")
  end

  it "should name be presente" do
    @event.name.should be_present
  end

  it "is invalid without a name" do
    @event.should_not be_valid
  end

  it "should have a day" do
  @event.day = Date.today
  @event.should be_present
  end
  
  it 'should have a time' do 
    @event.time = Time.now
    @event.should be_present 
  end
  
  it  'should be valid with event_type' do
    @event.event_type = "Workshop"
    @event.should be_present
  end
  it "is invalid without a type" do
    @event.should_not be_valid
  end

  it 'should have a description' do
    @event.description = "The retro washing machine is back"
    @event.description.should be_present
  end
  
  it "should have an organizer" do
    
  end


end

