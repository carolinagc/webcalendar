require 'spec_helper'
feature "AuthenticationPages" do
  scenario 'signin page' do
    visit signin_path
    expect(page).to have_content("Sign in")
  end
  scenario 'with invalid information' do
    visit signin_path
    expect(page).to have_content("Sign in")
    expect(page).to have_selector("div.alert.alert-error", :value => "Invalid")
  end
  scenario 'with valid information' do
    @user = User.create(:name => 'julia', :email => 'julia@lala.com', :password=> 'foolala', :password_confirmation => 'foolala')
    visit signin_path
    fill_in 'session_email', with: 'julia@lala.com'
    fill_in 'session_password', with: 'foolala'
    click_button 'Sign in'
    expect(page).to have_link('Sign out'), href: signout_path
    expect(page).not_to have_link('Sign in'), href: signin_path
  end
end
