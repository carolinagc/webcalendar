require 'spec_helper'

describe User do
  before :each do
    @user = FactoryGirl.create(:user, email: 'julia@lala.com')
  end

  it 'should have a name' do
    expect(@user).to be_valid
  end

  it 'is invalid without name' do
    @user = User.new
    expect(@user).to be_invalid
  end

  it 'should have unique mail' do
    user2 = FactoryGirl.build(:user, name: 'mark', email: 'julia@lala.com')
    expect(user2).to be_invalid
  end

  it 'should have password' do
    expect(@user.password).to be_present
    expect(@user.password_confirmation).to be_present
  end
end
