require 'spec_helper'

describe ApplicationHelper do

  context "gravatar_for" do
    it "returns the imaget tag and url for an email address" do
      email = "user@example.com"
      hash = Digest::MD5.hexdigest(email)

      expect(helper.gravatar_for(email)).to include "http://gravatar.com/avatar/#{hash}"
    end
  end

end
