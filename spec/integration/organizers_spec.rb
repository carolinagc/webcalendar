require 'spec_helper'

feature 'organizer' do
  before :each do
    @organizer = Organizer.create(:name => "K9", :description => "An intergalactic space")
  end
  scenario 'List of all the organizers' do
    visit organizers_path 
    expect(page).to have_content('List of organizers')
    expect(page).to have_content('Name')
    expect(page).to have_content('Description')
    expect(page).to have_link('Edit', href: edit_organizer_path(@organizer))
    expect(page).to have_link('Show', href: organizer_path(@organizer))
  end

  scenario 'Create a new organizer' do
    visit organizers_path
#    expect(page).to have_xpath('//html/body/div/a/img')
#    find(:xpath, "//html/body/div/a/img").click
#    find("#addIcon").click
    click_link ("Create organizer")
    expect(page).to have_content('Create organizer')
    fill_in 'Name', with: 'RailsGirls'
    click_button 'Create organizer'
    expect(page).to have_content('RailsGirls')
    expect(page).to have_link('Back')
  end

  scenario 'Show one organizer' do
    visit organizers_path
    visit organizer_path @organizer.id
    expect(page).to have_content("K9")
    expect(page).to have_link('Back')
  end

  scenario 'Update an existing organizer' do
    visit organizers_path
    visit edit_organizer_path @organizer.id
    fill_in 'Description', with: 'Changing the description'
    click_button 'Create organizer'
    expect(page).to have_content('Changing the description')
  end


  scenario 'Delete an existing organizer' do
    visit organizers_path
    expect { click_link('Delete') }.to change(Organizer, :count).by(-1)
  end

end
