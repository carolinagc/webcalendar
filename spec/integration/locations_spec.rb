# -*- coding: utf-8 -*-
require 'spec_helper'

feature 'location' do
  scenario 'List of all the locations' do
    I18n.available_locales.each do |locale|
      @location = Location.create(:name => "Betahaus", :address => "Prinzessinnenstrasse 19-20")
      visit locations_path(locale)
      expect(page).to have_content( I18n.translate! :list_of_locations)
      expect(page).to have_content(I18n.translate! :name)
      expect(page).to have_content(I18n.translate! :description)
      expect(page).to have_content(I18n.translate! :address)
      expect(page).to have_xpath("/html/body/section/article/table/tbody/tr/td[4]/a/img") #edit icon
      expect(page).to have_xpath("/html/body/section/article/table/tbody/tr/td[5]/a/img") #show icon
    end
  end

  scenario 'Create a new location' do
    I18n.available_locales.each do |locale|
      visit locations_path(locale)
      click_link (I18n.translate! :create_location)
      expect(page).to have_content(I18n.translate! :create_location)
#TODO refactor so that the labels Name and Address  can be check if it's translated
      fill_in 'location_name', :with => 'C-base'
      fill_in 'location_address', with: 'Rungestraße 20'
      click_button I18n.translate! :create_location
      expect(page).to have_content('C-base')
      expect(page).to have_xpath("/html/body/section/article/a/img")
    end
  end

  scenario 'Show one location' do
    I18n.available_locales.each do |locale|
      @location = Location.create(:name => "Betahaus", :address => "Prinzessinnenstrasse 19-20")
      visit locations_path(locale)
      visit location_path @location.id
      expect(page).to have_content("Betahaus")
      expect(page).to have_xpath("/html/body/section/article/a/img")
    end
  end

  scenario 'Update an existing location' do
    I18n.available_locales.each do |locale|
      @location = Location.create(:name => "Betahaus", :address => "Prinzessinnenstrasse 19-20")
      visit locations_path(locale)
      visit edit_location_path @location.id
      fill_in 'location_address', with: 'Veteranenstr 103'
      click_button I18n.translate! :create_location
      expect(page).to have_content('Veteranenstr 103')
    end
  end


  scenario 'Delete an existing location' do
    I18n.available_locales.each do |locale|
      @location = Location.create(:name => "Betahaus", :address => "Prinzessinnenstrasse 19-20")
      visit locations_path(locale)
      expect(page).to have_link(I18n.translate! :delete)
      expect { click_link(I18n.translate! :delete) }.to change(Location, :count).by(-1)
    end
  end
end

