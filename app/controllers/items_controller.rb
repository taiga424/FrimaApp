class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(12)
  end

  def show
  end

  def confirm
  end

  def new
  end

  def create
  end

  private
  def item_params
  end
end
