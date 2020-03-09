class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(3)
    @images = Image.all
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.where(item_id: @item.id)
    @shipping_day = Item.shipping_days.keys[@item.shipping_days-1]
    @area = Item.prefectures.keys[@item.area-1]
    @brand = Brand.find(@item.brand_id)
  end

  def confirm
  end

  def new
    @item = Item.new
    @brands = Brand.group(:name)

  end

  def create
    Item.create(item_params)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :condition, :fee, :area, :shipping_days, brand: [:name, :id])
  end
end
