require 'spec_helper'

feature 'view the homepage' do
  scenario 'List of events' do
    visit root_path
    expect(page).to have_css 'title', text: 'List of events'
  end
end
