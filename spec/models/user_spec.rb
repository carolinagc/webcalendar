require 'spec_helper'

describe User do
  before :each do
     @user = User.create(:name => 'julia', :email=> 'julia@lala.com', :password => 'foolala', :password_confirmation => 'foolala' )
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

  it 'should have password' do
    @user = User.create(:name => 'julia', :email=> 'julia@lala.com', :password => 'foolala', :password_confirmation => 'foolala' )
    expect(@user.password).to be_present
    expect(@user.password_confirmation).to be_present
  end
  it 'should remember_token' do
    expect(@user.remember_token).not_to be_blank
  end

end
