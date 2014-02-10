# -*- coding: utf-8 -*-
require 'spec_helper'

feature 'location' do
  scenario 'List of all the locations' do
    I18n.available_locales.each do |locale|
      @location = FactoryGirl.create(:location)
      visit locations_path(locale)
      expect(page).to have_content( I18n.translate! :list_of_locations)
      expect(page).to have_content(I18n.translate! :name)
      expect(page).to have_content(I18n.translate! :description)
      expect(page).to have_content(I18n.translate! :address)
      expect(page).to_not have_selector('.edit_organizer')
      expect(page).to have_xpath("/html/body/section/article/table/tbody/tr/td[4]/a/img") #show icon
    end
  end

  scenario 'Create a new location' do
    I18n.available_locales.each do |locale|
      sign_in
      visit new_location_path
#      binding.pry
      find(:xpath, '//*[@id="location_name"]').set 'C-base'      
      find(:xpath, '//*[@id="location_address"]').set 'Rungestraße 20'      
      find(:xpath, '//*[@id="new_location"]/div[5]/input').click 
      visit locations_path
      expect(page).to have_content('C-base')
      sign_out
    end
  end

  scenario 'Show one location' do
    I18n.available_locales.each do |locale|
      @location = FactoryGirl.create(:location, :name => "Betahaus")
      visit locations_path(locale)
      visit location_path(id: @location.id)
      expect(page).to have_content("Betahaus")
      expect(page).to have_xpath("/html/body/section/article/a/img")
    end
  end

  scenario 'Update an existing location' do
    I18n.available_locales.each do |locale|
      sign_in
      @location = FactoryGirl.create(:location)
      visit edit_location_path(id: @location.id)
      fill_in 'location_address', with: 'Veteranenstr 103'
      click_button I18n.translate! :create_location
      expect(page).to have_content('Veteranenstr 103')
      sign_out
    end
  end


  scenario 'Delete an existing location' do
    I18n.available_locales.each do |locale|
      sign_in
      @location = FactoryGirl.create(:location)
      visit locations_path(locale)
      expect(page).to have_link(I18n.translate! :delete)
      expect { click_link(I18n.translate! :delete) }.to change(Location, :count).by(-1)
      sign_out
    end
  end

  def sign_in
    @user = User.create(:name => "julia", :email => "julia@lala.com", :password =>"foolalala")
    visit '/users/sign_in'
    find(:xpath, "//*[@id='user_email']").set "julia@lala.com"      
    find(:xpath, '//*[@id="user_password"]').set "foolalala"      
#    fill_in 'user_email', with: "julia@lala.com"
#    fill_in 'user_password', with: "foolalala"
    click_button(I18n.translate! :sign_in)
  end

  def sign_out
    click_link("Sign out")
    expect(page).to have_content("Sign in")
  end


end

