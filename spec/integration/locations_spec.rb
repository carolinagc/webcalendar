# -*- coding: utf-8 -*-

require 'spec_helper'

feature 'location' do
  before :each do
    @location = Location.create(:name => "Betahaus", :address => "Prinzessinnenstrasse 19-20")
  end
  scenario 'List of all the locations' do
    visit locations_path 
    expect(page).to have_content('List of locations')
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_content('Address')
    expect(page).to have_link('Edit', href: edit_location_path(@location))
    expect(page).to have_link('Show', href: location_path(@location))
  end

  scenario 'Create a new location' do
    visit locations_path
#    expect(page).to have_xpath('//html/body/div/a/img')
#    find(:xpath, "//html/body/div/a/img").click
#    find("#addIcon").click
    click_link ("Create location")
    expect(page).to have_content('Create location')
    fill_in 'Name', with: 'C-base'
    fill_in 'Address', with: 'Rungestraße 20'
    click_button 'Create location'
    expect(page).to have_content('C-base')
    expect(page).to have_link('Back')
  end

  scenario 'Show one location' do
    visit locations_path
    visit location_path @location.id
    expect(page).to have_content("Betahaus")
    expect(page).to have_link('Back')
  end

  scenario 'Update an existing location' do
    visit locations_path
    visit edit_location_path @location.id
    fill_in 'Address', with: 'Veteranenstr 103'
    click_button 'Create location'
    expect(page).to have_content('Veteranenstr 103')
  end


  scenario 'Delete an existing location' do
    visit locations_path
    expect { click_link('Delete') }.to change(Location, :count).by(-1)
  end

end
