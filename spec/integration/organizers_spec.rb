require 'spec_helper'

feature 'organizer' do
  scenario 'List of all the organizers' do
    I18n.available_locales.each do |locale|
      @organizer = Organizer.create(:name => "K9", :description => "An intergalactic space")
      visit organizers_path(locale)
      expect(page).to have_content( I18n.t :list_of_organizers)
      expect(page).to have_content(I18n.t :name)
      expect(page).to have_content(I18n.t :description)
      expect(page).to have_content("K9")
      expect(page).to have_selector('.edit_organizer')
      expect(page).to have_selector('.show_organizer')
    end
  end

  scenario 'Create a new organizer' do
    I18n.available_locales.each do |locale|
      @organizer = Organizer.create(:name => "K9", :description => "An intergalactic space")

      visit organizers_path(locale)
  #    expect(page).to have_xpath('//html/body/div/a/img')
  #    find(:xpath, "//html/body/div/a/img").click
  #    find("#addIcon").click
      click_link (I18n.t :create_organizer)
      expect(page).to have_content I18n.t('create_organizer')
      fill_in 'organizer_name', with: 'RailsGirls'
      click_button I18n.t :create_organizer
      expect(page).to have_content('RailsGirls')
      expect(page).to have_selector('#backIcon')
    end
  end

  scenario 'Show one organizer' do
    I18n.available_locales.each do |locale|
      @organizer = Organizer.create(:name => "K9", :description => "An intergalactic space")

      visit organizers_path(locale)
      visit organizer_path(locale, @organizer.id)
      expect(page).to have_content("K9")
      expect(page).to have_selector('#backIcon')
    end
  end

  scenario 'Update an existing organizer' do
    I18n.available_locales.each do |locale|
      @organizer = Organizer.create(:name => "K9", :description => "An intergalactic space")
      visit organizers_path(locale)
      visit edit_organizer_path locale, @organizer.id
      fill_in 'organizer_description', with: 'Changing the description'
      click_button I18n.t :create_organizer
      expect(page).to have_content('Changing the description')
    end
  end


  scenario 'Delete an existing organizer' do
    I18n.available_locales.each do |locale|
      @organizer = Organizer.create(:name => "K9", :description => "An intergalactic space")

      visit organizers_path(locale)
      expect(page).to have_link(I18n.translate! :delete)
      expect { click_link( I18n.t!(:delete) ) }.to change(Organizer, :count).by(-1)
    end 
  end

end
