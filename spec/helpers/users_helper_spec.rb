require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe UsersHelper, type: :helper do
  let(:user) { create(:user) }

  describe "#has_posts?" do
    it "returns false if user has no posts" do
      expect(helper.has_posts?(user)).to be_falsey
    end

    it "returns true if user made any posts" do
      create(:post, user: user)
      expect(helper.has_posts?(user)).to be_truthy
    end
  end

  describe "#has_comments?" do
    it "returns false if no comments made" do
      expect(helper.has_comments?(user)).to be_falsey
    end

    it "returns true if comment has been made" do
      create(:comment, user: user)
      expect(helper.has_comments?(user)).to be_truthy
    end
  end

  describe "#has_favorites?" do
    it "returns false if no favorites made" do
      expect(helper.has_favorites?(user)).to be_falsey
    end

    it "returns true if favorites have been made" do
      create(:favorite, user: user)
      expect(helper.has_favorites?(user)).to be_truthy
    end
  end
end
