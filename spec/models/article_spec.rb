require "rails_helper"

describe Article do
  context "fill_title" do
    let(:article) do
      # described_class.create(
      #   title: title,
      #   body: "One two three"
      # )
      FactoryGirl.create :article,
        title: title,
        body: "One two three"
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

  describe "#last_comment_from" do
    let(:article) do
      FactoryGirl.create :article,
        title: "Not nil",
        body: "One two three"
    end
    let(:comments) { double "comment", last: nil }
    let(:commenter) { double "commenter", id: 1 }

    before do
      allow(article).to receive(:comments) { comments }
      allow(comments).to receive(:where) { comments }
      allow(comments).to receive(:order) { comments }
    end

    it "calls order method for filtered comments" do
      article.last_comment_from(commenter)

      expect(comments).to have_received(:order)
    end
  end
end
 