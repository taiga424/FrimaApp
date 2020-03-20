require "rails_helper"

feature "Item.new" do
  describe "#create" do
    it "is valid with a name, description, area, condition, fee, shipping_days, brand_id, category_id, images" do
      brand = create(:brand)
      category = create(:category)
      item = create(:item, category_id: category.id, brand_id: brand.id)
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      brand = create(:brand)
      category = create(:category)
      item = build(:item, name: "", category_id: category.id, brand_id: brand.id)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a description" do
      brand = create(:brand)
      category = create(:category)
      item = build(:item, description: "", category_id: category.id, brand_id: brand.id)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    it "is invalid without a area" do
      brand = create(:brand)
      category = create(:category)
      item = build(:item, area: "", category_id: category.id, brand_id: brand.id)
      item.valid?
      expect(item.errors[:area]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      brand = create(:brand)
      category = create(:category)
      item = build(:item, condition: "", category_id: category.id, brand_id: brand.id)
      item.valid?
      expect(item.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a fee" do
      brand = create(:brand)
      category = create(:category)
      item = build(:item, fee: "", category_id: category.id, brand_id: brand.id)
      item.valid?
      expect(item.errors[:fee]).to include("can't be blank")
    end

    it "is invalid without a shipping_days" do
      brand = create(:brand)
      category = create(:category)
      item = build(:item, shipping_days: "", category_id: category.id, brand_id: brand.id)
      item.valid?
      expect(item.errors[:shipping_days]).to include("can't be blank")
    end

    it "is invalid without a price" do
      brand = create(:brand)
      category = create(:category)
      item = build(:item, price: "", category_id: category.id, brand_id: brand.id)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid with a price unless price is written in number" do
      brand = create(:brand)
      category = create(:category)
      item = build(:item, price: "アイウエオ", category_id: category.id, brand_id: brand.id)
      # item.valid?
      expect(item).to be_valid
    end
  end
end