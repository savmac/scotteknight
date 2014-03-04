require 'spec_helper'

feature 'Visiting the home page' do
  scenario 'I should see header content' do
    visit root_path

    expect(page).to have_content('Scott E. Knight')
  end
end
