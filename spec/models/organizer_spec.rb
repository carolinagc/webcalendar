require 'spec_helper'

describe Organizer do

  it "should name be present" do
  @organizer = Organizer.new(:name => "OTS")  
  @organizer.name.should be_present
  end
  
  it 'should be invalid if no name is present' do
    @organizer = Organizer.new
    @orgnizer.should_not be_valid
  end  
  
  

end
