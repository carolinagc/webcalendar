require 'spec_helper'

feature 'events' do
  scenario 'List of all the events' do
    I18n.available_locales.each do |locale|
      @event = FactoryGirl.create(:event, name: "Printing the washing machine", event_type: "Workshop", public: true)
      visit events_path
      expect(page).to have_content(I18n.translate! :list_of_events)
      expect(page).to have_content(I18n.translate! :name)
      expect(page).to have_selector('#event_startdatetime')
      expect(page).to have_content(I18n.translate! :location)
      expect(page).to have_content(I18n.translate! :organizer)
      page.has_xpath?("//*[@id='events_table']/tbody/tr[1]/td[6]/a/img") #edit icon
      expect(page).to have_link('+ info', href: event_path(id: @event.id))
    end
  end

  scenario 'Create a new event' do
    I18n.available_locales.each do |locale|
      sign_in
      visit events_path
      find("#addIcon").click
      expect(page).to have_content(I18n.translate! :create_event)
      fill_in 'event_name', with: 'lala'
      fill_in 'event_startdatetime', with: Date.today
      fill_in 'event_event_type', with: 'Workshop'
      fill_in 'event_responsible', with: 'Tina'
      page.check("event_public")
      click_button I18n.translate! :create_event
      visit events_path
      expect(page).to have_content('lala')
      page.has_xpath?("//*[@id='backIcon']/img")
      sign_out
    end
  end
  scenario 'Show one event' do
    I18n.available_locales.each do |locale|
      @event = FactoryGirl.create(:event, name: "Printing the washing machine", public: true)
      visit events_path
      visit event_path(id: @event.id)
      expect(page).to have_content(I18n.translate! :description)
      expect(page).to have_content(I18n.translate! :event_type)
      expect(page).to have_content(I18n.translate! :responsible)
      expect(page).to have_content(I18n.translate! :public)
      expect(page).to have_content("Printing the washing machine")
      page.has_xpath?("//*[@id='backIcon']/img")
    end
  end
  scenario 'Update an existing event' do
    I18n.available_locales.each do |locale|
      @event = FactoryGirl.create(:event)
      sign_in
      visit events_path
      visit edit_event_path(id: @event.id)
      fill_in 'event_event_type', with: 'Film'
      click_button I18n.translate! :create_event
      expect(page).to have_content('Film')
      sign_out
    end
  end
  scenario 'Delete an existing event' do
    I18n.available_locales.each do |locale|
      @event = FactoryGirl.create(:event, name: "Printing the washing machine", event_type: "Workshop", public: true)
      sign_in
      visit events_path
#      require 'pry'; binding.pry
      page.has_xpath?("//*[@id='deleteIcon']/img")
      expect {find("#deleteIcon").click}.to change(Event, :count).by(-1)
      #      expect {click_link(I18n.translate! :delete) }.to change(Event, :count).by(-1)
      sign_out
    end
  end
  scenario 'Select a location' do
    I18n.available_locales.each do |locale|
      @event = FactoryGirl.create(:event)
      @location = FactoryGirl.create(:location, name: "Betahaus")
      sign_in
      visit edit_event_path(id: @event.id)
      expect(page).to have_content(I18n.translate! :location)
      find('select', :text => "Betahaus").click
      sign_out
    end
  end
  scenario 'Monthly calendar view' do
    I18n.available_locales.each do |locale|
      @event = FactoryGirl.create(:event, name: "Printing the washing machine", event_type: "Workshop", public: true)
      visit root_path (locale)
      expect(page).to have_content(I18n.translate! :week)
      expect(page).to have_content(Date.today.strftime("%B")) #month in words
      expect(page).to have_css("td.notmonth")
      expect(page).to have_link(@event.name, href: event_path(locale, @event))
    end
  end

  scenario 'Show one event coming from calendar view' do
    I18n.available_locales.each do |locale|
      @event = FactoryGirl.create(:event, name: "Printing the washing machine", event_type: "Workshop", public: true)
      visit root_path
      visit event_path(id: @event.id)
      expect(page).to have_content('Printing the washing machine')
      expect(page).to have_content('Workshop')
      expect(page).to have_content(I18n.translate! :duration)
      find("#backIcon").click
      expect(page).to have_content(I18n.translate! :week)
    end
  end
  scenario 'Show week view' do
    I18n.available_locales.each do |locale|
      visit root_path
      click_link(I18n.translate! :week)
    end
  end

  scenario 'Show only public events' do
    @event = FactoryGirl.create(:event, name: "Printing the washing machine", event_type: "Workshop", :startdatetime => Date.today, :public => false)
    @event2 = FactoryGirl.create(:event, name: "Freedom of Internet", event_type: "Workshop",:startdatetime => Date.today, :public => true)
    visit root_path
    expect(page).to have_content("Freedom of Internet")
    expect(page).to_not have_content("Secret meeting")
  end

  scenario 'if user signed in show all events' do
    @event = Event.create(:name => "Secret meeting", :event_type => "Workshop", :startdatetime => Date.today, :public => false)
    @event2 = Event.create(:name => "Freedom of Internet", :event_type => "Discussion", :startdatetime => Date.today, :public => true)
    sign_in
    expect(page).to have_content("Secret meeting")
  end


  def sign_in
    @user = User.create(:name => "julia", :email => "julia@lala.com", :password =>"foolalala")
    visit '/users/sign_in'
    fill_in 'user_email', with: "julia@lala.com"
    fill_in 'user_password', with: "foolalala"
    click_button(I18n.translate! 'devise.sessions.new.sign_in')
    expect(page).to have_content("Sign out")
    visit events_path
  end

  def sign_out
    click_link("Sign out")
    expect(page).to have_content("Sign in")
  end

end
