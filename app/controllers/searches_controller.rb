class SearchesController < ApplicationController

  def index
    @items = Item.search(params[:search]).limit(132).order("id DESC")
    @search = params[:search]
  end

end
