require 'spec_helper'

feature 'Creating blog posts' do
  scenario 'I should be able to create a new post' do
    visit root_path
    click_link 'New post'

    fill_in 'Title', with: 'My New Blog Post'
    fill_in 'Body', with: 'This is the content of my new blog post.'

    click_button 'Create Post'

    expect(page).to have_css 'h2.post-title', text: 'My New Blog Post'
    expect(page).to have_css 'p.post-body', text: 'This is the content of my new blog post.'
  end
end
