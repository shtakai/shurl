require('rails_helper')

RSpec.describe 'Urls', type: :system do
  it 'grab -short url- on index', js: true do
    visit root_path
    expect(page).to have_content('short url')
  end

  it 'submit with valid URL, then grab result information' do
    visit root_path
    fill_in placeholder: 'enter URL', with: 'http://www.altavista.digital.com'
    click_button 'Create Url'
    expect(page).to have_content('GENERATED')
  end

  it 'submit with invalid URL, then grab error notice' do
    visit root_path
    fill_in placeholder: 'enter URL', with: 'htp://www.altavista.digital.com'
    click_button 'Create Url'
    expect(page).to have_content('INVALID URL')
  end

  it 'submit with empty URL, then grab error notice' do
    visit root_path
    click_button 'Create Url'
    expect(page).to have_content('INVALID URL')
  end
end
