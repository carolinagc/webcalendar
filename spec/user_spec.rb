require 'spec_helper'

feature 'User pages' do
  scenario 'sign up' do
    visit sigup_path
    expect(page).to have_content('Name')
    fill_in 'Name', with: 'julia'
    fill_in 'EMail', with: 'julia@lala.com'
    fill_in 'Password', with: 'foobar'
    fill_in 'Confirmation', with: 'foobar'
    expect{(click_button 'Create account')}.to change(User, :count).by(1)
  end



end
