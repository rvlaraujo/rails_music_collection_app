require 'rails_helper'
require 'faker'

RSpec.describe 'Registration Users', type: :system do
  it 'Registration a user with blank username' do
    visit new_user_registration_path
    fill_in 'Username', with: ''
    fill_in 'Full name', with: Faker::FunnyName.two_word_name
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_on 'Sign up'

    expect(page).to have_content("Username can't be blank")
  end

  it 'Registration a user with invalid username' do
    visit new_user_registration_path
    fill_in 'Username', with: Faker::Name.initials(number: 5)
    fill_in 'Full name', with: Faker::FunnyName.two_word_name
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_on 'Sign up'

    expect(page).to have_content('Username is too short (minimum is 6 characters)')
  end

  it 'Registration a user with blank Full name' do
    visit new_user_registration_path
    fill_in 'Username', with: Faker::Name.initials(number: 6)
    fill_in 'Full name', with: ''
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_on 'Sign up'

    expect(page).to have_content("Full name can't be blank")
  end

  it 'Registration a user with invalid Full name' do
    visit new_user_registration_path
    fill_in 'Username', with: Faker::Name.initials(number: 6)
    fill_in 'Full name', with: Faker::Name.initials(number: 7)
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_on 'Sign up'

    expect(page).to have_content('Full name is too short (minimum is 8 characters)')
  end

  it 'Registration a user with blank passowrd' do
    visit new_user_registration_path
    fill_in 'Username', with: Faker::Name.initials(number: 6)
    fill_in 'Full name', with: Faker::FunnyName.two_word_name
    fill_in 'Password', with: ''
    fill_in 'Password confirmation', with: ''

    click_on 'Sign up'

    expect(page).to have_content("Password can't be blank")
  end

  it 'Registration a user with invalid password' do
    visit new_user_registration_path
    fill_in 'Username', with: Faker::Name.initials(number: 6)
    fill_in 'Full name', with: Faker::FunnyName.two_word_name
    fill_in 'Password', with: '12345'
    fill_in 'Password confirmation', with: '12345'

    click_on 'Sign up'

    expect(page).to have_content('Password is too short (minimum is 6 characters)')
  end

  it 'Try to registrate a valid user' do
    visit new_user_registration_path
    fill_in 'Username', with: Faker::Name.initials(number: 6)
    fill_in 'Full name', with: Faker::FunnyName.two_word_name
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_on 'Sign up'

    expect(page).to have_current_path(artists_path)
  end
end
