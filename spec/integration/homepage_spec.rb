require 'spec_helper'

feature 'homepage' do
  scenario 'user has to log in' do
    I18n.available_locales.each do |locale|
      visit root_path
      expect(page).to have_css 'title', text: 'Webcalendar'
    end
  end

end
