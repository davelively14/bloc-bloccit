require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe "attributes" do
    let(:question) { Question.create!(title: "Title", body: "Question body")}
    let(:answer) { Answer.create!(body: "Answer body", question: question)}

    it "has a body attribute" do
      expect(answer).to have_attributes(body: "Answer body")
    end
  end
end
