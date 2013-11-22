require 'spec_helper'

describe User do
  it 'should have a name' do
    @user = User.new(:name => 'julia')
    @user.should be_valid
  end
  it 'is invalid without name' do
    @user = User.new
    @user.should_not be_valid
  end
  it 'should have unique mail' do
    @user = User.create(:name => 'julia', :email=> 'example@lala.com' )
    @user1 = User.new(:name => 'mark', :email=> 'example@lala.com' )
    @user1.valid?
    expect(@user1).to have(1).errors_on(:email)
    
  end

end
