class Event 
attr_accessor :name, :description, :start_time, :end_time
  def initialize
    @name = "Printing washing machines"
    @description = ""
    @start_time = Time.now
    @end_time = Time.now + 1
  end

end

describe 'Event' do
  before(:each) do
    @event = Event.new
  end
  it "should initialize with default values" do
    @event.name.should == "Printing washing machines"
    @event.description.should == ""
    @event.start_time = Time.now
    @event.end_time = Time.now + 1
  end

  it "raises error when name empty" do
    @event.name.should_not be_empty
  end
  it "should have a location"
  it "should have a category"
  it "should have a type"
  it "should have an organizer"
end
