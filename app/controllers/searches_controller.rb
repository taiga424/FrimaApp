class SearchesController < ApplicationController

  before_action :set_ransack

  def index
    @items = Item.search(params[:search]).limit(132).order("id DESC")
    @search = params[:search]
  end
  
  def detail_search
    # binding.pry
    @search_item = Item.ransack(params[:q]) 
    @items = @search_item.result
  end

private


  def set_ransack
    @q = Item.ransack(params[:q])
  end



end
