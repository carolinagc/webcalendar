require 'spec_helper'

describe Location do
  before :each do
    @location = Location.new(:name =>"Betahaus", :address => "Prinzessinnenstrassee 19-20")
  end

  it 'should have a name' do
    expect(@location).to be_present
  end

  it 'should be invalid if it has no name' do
    @location = Location.new
    expect(@location).to_not be_valid
  end

  it 'should have an address' do
    expect(@location.address).to be_present
  end
 
  it 'includes events' do
    event1 = Event.new(:name => 'Event1', :startdatetime => Date.today)
    event2 = Event.new(:name => 'Event2', :startdatetime => Date.today+1)
    location = Location.new(:name => 'lala', events: [event1, event2])
#    location = Location.new(:name => 'lala', events)
    location.events.should include(event1)
    location.should have(2).events
  end

end
