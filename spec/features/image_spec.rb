require "rails_helper"

feature "Image.new" do
  describe "#create" do
    it "is valid with a content, item_id" do
      item = create(:item)
      image = build(:image, item_id: item.id)
      expect(image).to be_valid
    end

    it "is invalid without a content" do
      item = create(:item)
      image = build(:image, content: "", item_id: item.id)
      image.valid?
      expect(image.errors[:content]).to include("can't be blank")
    end
  end
end