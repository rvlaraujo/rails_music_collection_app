require 'rails_helper'

RSpec.describe 'Failed login attempt', type: :system do
  let(:user) { FactoryBot.create(:user, :admin) }
  let(:custom_error_message) { "Sorry, we couldn't find an account with this username. Please check you're using the right username and try again." }

  it 'A failed login attempt will send not registred user back to the login page with custom error message' do
    visit root_path
    fill_in 'Username', with: 'notregistreduser'
    fill_in 'Password', with: 'noneapassword'
    click_button 'Log in'

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content(custom_error_message)
  end

  it 'A failed login attempt will send registred user back to the login page with custom error message' do
    visit root_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'noneapassword'
    click_button 'Log in'

    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content(custom_error_message)
  end
end
