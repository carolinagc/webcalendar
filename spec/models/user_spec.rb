require 'spec_helper'

describe User do
  before :each do
    @user = User.create(:name => 'julia', :email => 'julia@lala.com')
  end

  it 'should have a name' do
    expect(@user).to be_valid
  end
  it 'is invalid without name' do
    @user = User.new
    expect(@user).to_not be_valid
  end
  it 'should have unique mail' do
    @user1 = User.new(:name => 'mark', :email=> 'julia@lala.com')
    @user1.valid?
    expect(@user1).to have(1).errors_on(:email)
  end

end
