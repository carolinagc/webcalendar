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

  describe "when url format is valid" do
    it "should be valid" do
      @location = Location.new(:name => "betahaus", :address => "Prinzessinnenstrassee 19-20")
      urls = %w[http://www.google.com/ http://www.another.valid.url.com/ http://www.another-valid-url.com/]
      urls.each do |valid_url|
        @location.url = valid_url
        expect(@location).to be_valid
      end
    end
  end

  describe "when url format is invalid" do
    it "should be invalid" do
      @location = Location.new(:name => "betahaus", :address => "Prinzessinnenstrassee 19-20")
      urls = %w["www..google..com" "http://www.an invalid url.com/" "http://www.an+invalid+url.com/"]
      urls.each do |invalid_url|
        @location.url = invalid_url
        expect(@location).not_to be_valid
      end
    end
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
