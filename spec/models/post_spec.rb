require 'spec_helper'

describe Post do
  it 'defaults to reverse chronological order' do
    post_new = FactoryGirl.create(:post, created_at: Time.now+1.day)
    post_old = FactoryGirl.create(:post, created_at: Time.now-1.day)

    expect(Post.all).to eq [post_new, post_old]
  end
end
