class ItemsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :brand, :condition, :fee, :area, :shipping_days).merge(user_id: current_user.id)
  end

  def category_params
    params.require(:category).permit(:name, :ancestry)
  end
end
