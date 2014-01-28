require 'spec_helper'
feature "AuthenticationPages" do
  scenario 'signin page' do
    visit new_user_session_path
    expect(page).to have_content("Sign in")
  end
  scenario 'with invalid information' do
    visit new_user_session_path
    expect(page).to have_content("Sign in")
    expect(page).to have_selector("div.alert.alert-error", :value => "Invalid")
  end
  scenario 'with valid information' do
    @user = User.create(:name => 'julia', :email => 'julia@lala.com', :password=> 'foolala', :password_confirmation => 'foolala')
    visit new_user_session_path
    fill_in 'user_email', with: 'julia@lala.com'
    fill_in 'user_password', with: 'foolalala'
    click_button 'Sign in'
    expect(page).to have_link('Sign out'), href: signout_path
    expect(page).not_to have_link('Sign in'), href: signin_path
  end
end
