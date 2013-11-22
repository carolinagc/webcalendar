require 'spec_helper'
describe Tag do
  it 'should have a tag' do
    @tag = Tag.new(:tag => 'Maker')
    @tag.should be_present
  end
  it 'should not be valid' do
    @tag = Tag.new
    @tag.should_not be_valid
  end
end
