require 'spec_helper'

feature 'calendar' do
  before :each do
    @event = Event.create(:name => "Printing the washing machine", :event_type => "Workshop", :startdatetime => Date.today)
  end
  scenario 'Monthly calendar view' do
    visit root_path 
    expect(page).to have_content('Week')
    expect(page).to have_content(Date.today.strftime("%B")) #month in words
    expect(page).to have_css("td.notmonth")
    expect(page).to have_link(@event.name, href: event_path(@event))
  end
  scenario 'Show one event' do
    visit root_path 
    visit event_path @event.id
    expect(page).to have_content('Printing the washing machine')
    expect(page).to have_content('Workshop')
    expect(page).to have_content('Duration')
    find("#backIcon").click
    expect(page).to have_content("Week")
  end
  scenario 'Show week view' do
    visit root_path 
    click_link("Week")
  end
  scenario 'Check is week view' do
    pending ("Week view checking should be done")
  end

end
