# -*- coding: utf-8 -*-
require 'spec_helper'

feature 'location' do

  before :each do
    @location = Location.create(:name => "Betahaus", :address => "Prinzessinnenstrasse 19-20")
  end
  scenario 'List of all the locations' do
    I18n.available_locales.each do |locale|
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
      #    expect(page).to have_xpath('//html/body/div/a/img')
      #    find(:xpath, "//html/body/div/a/img").click
      #    find("#addIcon").click
      click_link (I18n.translate! :create_location)
      expect(page).to have_content(I18n.translate! :create_location)
      fill_in (I18n.translate! :name), with: 'C-base'
      fill_in I18n.translate! :address, with: 'Rungestraße 20'
      click_button I18n.translate! :create_location
      expect(page).to have_content('C-base')
      expect(page).to have_link(I18n.translate! :back)
    end
  end

  scenario 'Show one location' do
    I18n.available_locales.each do |locale|
      visit locations_path(locale)
      visit location_path @location.id
      expect(page).to have_content("Betahaus")
      expect(page).to have_link('Back')
    end
  end

  scenario 'Update an existing location' do
    I18n.available_locales.each do |locale|
      visit locations_path(locale)
      visit edit_location_path @location.id
      fill_in 'Address', with: 'Veteranenstr 103'
      click_button 'Create location'
      expect(page).to have_content('Veteranenstr 103')
    end
  end


  scenario 'Delete an existing location' do
    I18n.available_locales.each do |locale|
      visit locations_path(locale)
      expect { click_link('Delete') }.to change(Location, :count).by(-1)
    end
  end
end

