class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id) 
    @items_purchase = Item.where(purchase_id: current_user.id)
    @items_new = Item.where(user_id: current_user.id)
  end

  def show
  end

  def likes
    @user = User.find(current_user.id) 
  end
end