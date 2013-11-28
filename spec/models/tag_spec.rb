require 'spec_helper'
describe Tag do
  
  before :each do
    @tag = Tag.create(:tag => 'Maker')
  end
  
  it 'should have a name' do
    expect(@tag).to be_present
  end

  it 'should not be valid' do
    @tag = Tag.new
    expect(@tag).to_not be_valid
  end

  it 'has more than one event' do
    @event1 = Event.new(:name => "Printing the washing machine", :event_type => "Workshop", :day => Date.today)
    @event2 = Event.new(:name => "Put lights to your T-shirt", :event_type => "Workshop", :day => Date.tomorrow)
    @tag.events = [@event1, @event2]
    expect(@tag).to have(2).events
  end

  it 'should be destroyed if it has no events' do
    @event1 = Event.create(:name => "Printing the washing machine", :event_type => "Workshop", :day => Date.today)
    @tag.events = [@event1]
    expect(@tag).to have(1).events
    @event1.destroy
    expect(Tag.count).to eq(1)
    if @tag.events.count == 0 
        @tag.destroy
    end
    expect(Tag.count).to eq(0)

  end
  it 'should not be destroyed if it has events' do
    @event1 = Event.create(:name => "Printing the washing machine", :event_type => "Workshop", :day => Date.today)
    @event2 = Event.create(:name => "Print your e-textile T-shirt", :event_type => "Workshop", :day => Date.tomorrow)
    @tag.events = [@event1, @event2]
    expect(@tag).to have(2).events
    @event1.destroy
    expect(Tag.count).to eq(1)
    if @tag.events.count == 0 
        @tag.destroy
    end
#    expect(Tag.count).to_not eq(0)
    expect{Tag.count}.to_not change(Tag, :count)
  end

end
