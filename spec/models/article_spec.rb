require "rails_helper"

describe Article do
  context "fill_title" do
    let(:article) do
      described_class.new(
        title: title,
        body: "One two three"
      )
    end

    before do
      article.valid?
    end

    context "when title is nil" do
      let(:title) { nil }

      it "fills title with words from body" do
        expect(article.title).to eq("One two")
      end
    end

    context "when title is not nil" do
      let(:title) { "Not nil" }

      it "does not overwrite title" do
        expect(article.title).to eq("Not nil")
      end
    end
  end
end
