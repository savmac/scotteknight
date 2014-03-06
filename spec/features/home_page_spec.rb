require 'spec_helper'

feature 'Visiting the home page' do
  scenario 'I should see header content' do
    visit root_path

    expect(page).to have_content('Scott E. Knight')
    expect(page).to have_content('About')
  end

  scenario 'I can visit the about page' do
    visit root_path
    click_link 'About'

    expect(page).to have_content('About Scott')
  end

  scenario 'I can get back to the home page' do
    visit about_path
    click_link 'Scott E. Knight'

    expect(current_path).to eq root_path
  end

end

feature 'Viewing blog posts' do
  before :each do
    @post = FactoryGirl.create(:post)
  end
  scenario 'I should see blog post titles on the home page' do
    visit root_path

    expect(page).to have_content "#{@post.title}"
  end

  scenario 'I can click on a post title and view the whole post' do
    visit root_path
    click_link "#{@post.title}"

    expect(page).to have_content "#{@post.body}"
  end
end
