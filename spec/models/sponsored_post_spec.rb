require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
  let(:title) {RandomData.random_sentence}
  let(:body) {RandomData.random_sentence}
  let(:price) {RandomData.random_price}

  let(:topic) {Topic.create!(name: "test topic", description: "Topic Description")}
  let(:sponsoredpost) {topic.sponsored_posts.create!(title: title, body: body, price: price)}

  it { is_expected.to belong_to(:topic)}

  describe "attributes" do
    it "has title body and price" do
      expect(sponsoredpost).to have_attributes(title: title, body: body, price: price)
    end
  end

end
