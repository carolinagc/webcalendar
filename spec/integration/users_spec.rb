require 'spec_helper'

feature 'User' do
  scenario 'Create account' do
    fill_in_name_email
    fill_in 'user_password', with: 'foobar23'
    fill_in 'user_password_confirmation', with: 'foobar23'
    expect { click_button(I18n.t 'devise.registrations.new.sign_up') }.to change(User, :count).by(1)
  end

  scenario 'passwords mismatch'  do
    fill_in_name_email
    fill_in 'user_password', with: 'foobar'
    fill_in 'user_password_confirmation', with: 'foolala'
    expect { click_button(I18n.t 'devise.registrations.new.sign_up') }.to change(User, :count).by(0)
  end

  scenario 'password should not be blank' do
    fill_in_name_email
    fill_in 'user_password', with: ''
    fill_in 'user_password_confirmation', with: ''
    expect { click_button(I18n.t 'devise.registrations.new.sign_up') }.to change(User, :count).by(0)
  end

  scenario 'password length has to be at least 6 characters' do
    fill_in_name_email
    fill_in 'user_password', with: 'foo'
    fill_in 'user_password_confirmation', with: 'foo'
    expect { click_button(I18n.t 'devise.registrations.new.sign_up') }.to change(User, :count).by(0)
  end

  

  def fill_in_name_email 

    visit new_user_registration_path(:en)
    expect(page).to have_content(I18n.t (:name))
    fill_in 'user_name', with: 'julia'
    fill_in 'user_email', with: 'julia@lala.com'
   
  end

end
