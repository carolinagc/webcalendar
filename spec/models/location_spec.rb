require 'spec_helper'

describe Location do
  before :all do
    @location = FactoryGirl.build(:location)
  end

  it { expect(@location).to respond_to(:url) }

  it 'should have a name' do
    expect(@location.name).to be_present
  end

  it 'should be invalid if it has no name' do
    expect(Location.new).to be_invalid
  end

  it 'should have an address' do
    expect(@location.address).to be_present
  end

  it 'should include events' do
    event1 = FactoryGirl.build(:event, name: "Event1",
                               startdatetime: Date.today)
    event2 = FactoryGirl.build(:event, name: "Event2",
                               startdatetime: Date.today + 1)
    @location.events = [event1, event2]

    expect(@location.events).to include(event1, event2)
  end
end
