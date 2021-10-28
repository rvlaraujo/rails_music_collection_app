require 'rails_helper'

RSpec.describe 'Redirect to Artists Page after Login', type: :system do
  let(:user) { FactoryBot.create(:user, :admin) }

  it 'If user has a successful log in, his redirect to Artists Index page' do
    visit albums_path
    expect(page).to have_current_path(new_user_session_path)

    fill_in 'Username', with: user.username.to_s
    fill_in 'Password', with: user.password.to_s
    click_button 'Log in'

    expect(page).to have_current_path(artists_path)
  end
end
