require 'spec_helper'
describe Tag do
  before :each do
    @tag = FactoryGirl.create(:tag)
    user = FactoryGirl.create(:user)
    @calendar = FactoryGirl.create(:calendar, user: user)
  end

  it 'should have a name' do
    expect(@tag).to be_present
  end

  it 'should not be valid' do
    expect(Tag.new).to be_invalid
  end

  it 'should have more than one event associated' do
    @tag.events = FactoryGirl.build_list(:event, 2, calendar: @calendar)
    expect(@tag).to have(2).events
  end

  it 'should be destroyed if it has no events' do
    @event1 = FactoryGirl.create(:event, calendar: @calendar)
    @tag.events = [@event1]
    # If you want to implement this behavior, uncomment this line to get started:
    # expect{@event1.destroy}.to change{@tag.nil?}.from(false).to(true)
    pending "Actual implentation seems to be missing"
  end

  it 'should not be destroyed if it has events' do
    @tag.events = FactoryGirl.create_list(:event, 2, calendar: @calendar)
    expect{@tag.events.first.destroy}.not_to change{@tag.nil?}.from(false).to(true)
  end
end
