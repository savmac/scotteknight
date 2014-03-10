require 'spec_helper'

describe ApprovedUser do
  it "approves the proper users" do
    user_params = { email: 'scotteknight@gmail.com', password: 'password' }
    expect(ApprovedUser.new(user_params).approved?).to be_true
  end

  it "does not approve other users" do
    user_params = { email: 'wronguser@example.com', password: 'password' }
    expect(ApprovedUser.new(user_params).approved?).to be_false
  end
end
