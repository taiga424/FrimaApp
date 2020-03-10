class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy]

  def index
    @items = Item.all.limit(12)
    @images = Image.all

  end

  def show
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
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :condition, :fee, :area, :shipping_days, brand: [:name, :id]).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
