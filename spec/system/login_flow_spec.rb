require 'rails_helper'

RSpec.describe 'Login Flow Features', type: :system do
  it 'If a not-logged in user tries to access any internal page he should be redirect to the login page' do
    visit albums_path

    expect(page).to have_current_path(new_user_session_path)
  end
end
