class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(3)
  end

  def show
  end

  def new
  end

  def create
  end

  private
  def item_params
  end
end
