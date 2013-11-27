require 'spec_helper'

feature 'homepage' do
  scenario 'user has to log in' do
    visit root_path
    expect(page).to have_css 'title', text: 'Webcalendar'
  end


end
