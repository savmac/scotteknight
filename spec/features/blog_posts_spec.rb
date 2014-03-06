require 'spec_helper'

feature 'Creating blog posts' do
  scenario 'I should be able to create a new post' do
    create_a_new_post

    expect(page).to have_css 'h1.post-title', text: 'My New Blog Post'
    expect(page).to have_css 'p.post-body', text: 'This is the content of my new blog post.'
  end

  scenario 'I should be able to edit a post' do
    create_a_new_post
    click_link 'Edit'
    fill_in 'Title', with: 'Updated Title'
    click_button 'Update Post'

    expect(page).to have_css 'h1.post-title', text: 'Updated Title'
  end

  def create_a_new_post
    visit root_path
    click_link 'New post'

    fill_in 'Title', with: 'My New Blog Post'
    fill_in 'Body', with: 'This is the content of my new blog post.'

    click_button 'Create Post'
  end
end
