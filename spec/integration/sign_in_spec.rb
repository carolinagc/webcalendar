require 'spec_helper'
feature 'sign in as user' do
  scenario 'with email' do
    sign_in_as 'julia@lala.com'
    expect(page).to have_css '.user', text: 'Welcome julia@lala.com'
  end

end
