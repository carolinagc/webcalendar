require 'spec_helper'
describe Tag do
  before.each do
    @tag = Tag.new(:tag => 'Maker')
  end
  
  it 'should have a tag' do
    @tag.should be_present
  end

  it 'should not be valid' do
    @tag = Tag.new
    @tag.should_not be_valid
  end

  it 'should have an event associated'

  it 'should be destroyed if no event is associated'

  


end
