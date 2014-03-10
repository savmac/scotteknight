require 'spec_helper'

feature 'Creating blog posts' do
  scenario 'I should be able to create a new post when logged in' do
    sign_in_user
    create_a_new_post

    expect(page).to have_css 'h1.post-title', text: 'My New Blog Post'
    expect(page).to have_css 'div.post-body', text: 'This is the content of my new blog post.'
  end

  scenario 'I should not be able to create a new post when not logged in' do
    visit new_post_path
    expect(current_path).to eq new_session_path
  end

  scenario 'I should be able to edit a post when logged in' do
    sign_in_user
    create_a_new_post
    click_link 'Edit'
    fill_in 'Title', with: 'Updated Title'
    click_button 'Update Post'

    expect(page).to have_css 'h1.post-title', text: 'Updated Title'
  end

  scenario 'I should not be able to edit a post when not logged in' do
    post = FactoryGirl.create(:post)
    visit edit_post_path(post)

    expect(current_path).to eq new_session_path
  end

  def sign_in_user
    user = FactoryGirl.create(:user)
    sign_in(user)
  end

  def create_a_new_post
    visit new_post_path

    fill_in 'Title', with: 'My New Blog Post'
    fill_in 'Body', with: 'This is the content of my new blog post.'

    click_button 'Create Post'
  end
end
