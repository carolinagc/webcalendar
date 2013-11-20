require 'spec_helper'

describe Organizer do
  before :each do
    @organizer = Organizer.new(:name => "OTS")
  end

  it "should name be presente" do
    @organizer.name.should be_present
  end


end
