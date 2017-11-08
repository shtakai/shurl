require('rails_helper')

RSpec.describe 'Urls', type: :system do
  it 'grab -short url- on index', js: true do
    visit root_path
    expect(page).to have_content('short url')
  end
end
