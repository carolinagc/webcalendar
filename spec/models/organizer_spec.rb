require 'spec_helper'

describe Organizer do
  before do
    @organizer = FactoryGirl.build(:organizer)
  end

  it "should have a name" do
    expect(@organizer.name).to be_present
  end

  it 'should be invalid if no name is present' do
    expect(Organizer.new).to be_invalid
  end

  it { should respond_to(:url) }
end
