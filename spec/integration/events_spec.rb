require 'spec_helper'

feature 'events' do
  before :each do
    @event = Event.create(:name => "Printing the washing machine", :event_type => "Workshop", :startdatetime => Date.today)
  end
  scenario 'List of all the events' do
    visit events_path 
    expect(page).to have_content('List of events')
    expect(page).to have_content('Name')
    expect(page).to have_selector('#event_startdatetime')
    expect(page).to have_content('Location')
    expect(page).to have_content('Organizer')
    expect(page).to have_link('Edit', href: edit_event_path(@event))
    expect(page).to have_link('+ info', href: event_path(@event))
  end

  scenario 'Create a new event' do
    visit events_path
    find("#addIcon").click
    expect(page).to have_content('Create new event')
    fill_in 'Name', with: 'lala'
    fill_in 'event_startdatetime', with: Date.today
    fill_in 'Event type', with: 'Workshop'
    fill_in 'Responsible', with: 'Tina'
    page.check("event_public")
    click_button 'Create event'
    visit events_path
    expect(page).to have_content('lala')
    expect(page).to have_link('Back')
  end

  scenario 'Show one event' do
    visit events_path
    visit event_path @event.id
    expect(page).to have_content('Description')
    expect(page).to have_content('Event type')
    expect(page).to have_content('Person responsible')
    expect(page).to have_content('Public')
    expect(page).to have_content("Printing the washing machine")
    expect(page).to have_link('Back')
  end

  scenario 'Update an existing event' do
    visit events_path
    visit edit_event_path @event.id
    fill_in 'Event type', with: 'Film'
    click_button 'Create event'
    expect(page).to have_content('Film')
  end

  scenario 'Delete an existing event' do
    visit events_path
    expect { click_link('Delete') }.to change(Event, :count).by(-1)
  end

  scenario 'Select a location' do
    @location = Location.create(:name => "Betahaus", :address => "Prinzessinnenstrasse 19-20")
    visit edit_event_path @event.id
    expect(page).to have_content('Location')
    find('select', :text => "Betahaus").click 

  end


end
