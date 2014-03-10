require 'spec_helper'

feature 'Signing in users' do
  before(:each) do
    FactoryGirl.create(:user)
  end
  scenario 'signs in a user with a valid email and password' do
    visit new_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(page).to have_css 'li.greeting', text: 'user@example.com'
  end

  scenario 'redirects users who do not have a valid email and password' do
    visit new_session_path
    fill_in 'Email', with: 'unregistereduser@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    expect(current_path).to eq magic_word_path
  end
end

feature 'Signing up users' do
    scenario 'registers approved users' do
      visit new_user_path
      fill_in 'Email', with: 'scotteknight@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'

      expect(current_path).to eq root_path
    end

    scenario 'redirects unapproved users from registering' do
      visit new_user_path
      fill_in 'Email', with: 'unapproved@example.com'
      fill_in 'Password', with: 'password'
      click_button 'Sign up'

      expect(current_path).to eq magic_word_path
    end
  end
