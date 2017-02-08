require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:ad) { Advertisement.create!(title: "New title", body: "Body", price: 99) }

  describe "attributes" do
    it "has a title, body, and price attribute" do
      expect(ad).to have_attributes(title: "New title", body: "Body", price: 99)
    end
  end
end
