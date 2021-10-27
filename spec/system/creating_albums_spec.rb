require 'rails_helper'

RSpec.describe 'Creatin Albums', type: :system do
  let(:user) { FactoryBot.create(:user, :admin) }

  it 'Creating albums with allowed Artists from endpoint' do
    artists_list = ArtistsManager::ListArtistsService.call

    login_as(user, scope: :user)

    visit new_album_path

    select artists_list.first.name, from: 'Artist'
    fill_in 'Name', with: 'Just an Album'
    fill_in 'Year', with: '2013'
    click_button 'Create Album'

    expect(page).to have_content('Album was successfully created.')
  end
end
