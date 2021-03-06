class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :pay, :confirm, :done]

  require 'payjp'

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    
    @items = Item.all.limit(12).order("id DESC")
    @images = Image.all
    @image = @images.where(item_id: @items.ids)
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @user = User.find_by(id: @item.user_id)
    @images = Image.where(item_id: @item.id)
    @shipping_day = @item.shipping_days
    @area = @item.area
    if @item.brand_id?
      @brand = Brand.find(@item.brand_id)
    end
  end

  def confirm
    @images = Image.where(item_id: @item.id)
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
  def done
    @images = Image.where(item_id: @item.id)
  end
  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    :amount => @item.price, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
      )
    if @item.update( purchase_id: current_user.id)
      redirect_to action: 'done' #完了画面に移動
    else
      render :confirm
    end
  end

  def new
    @item = Item.new
    @brands = Brand.all
    @category_parent_array = ["指定なし"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save && @item.images.count != 0
      @image = @item.images.create
      redirect_to :root
    else
      flash[:notice] = '画像を１枚以上添付してください'
      redirect_to new_item_path
    end

  end

  def edit
    @images = @item.images
    @brands = Brand.all
    @grandchild_category = @item.category
    @child_category = @grandchild_category.parent 
    @parent_category = @child_category.parent

    @category_parent_array = ["指定なし"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: @child_category.ancestry).each do |child|
      @category_children_array << child
    end

    @category_grandchildren_array = []
    Category.where(ancestry: @grandchild_category.ancestry).each do |grandchild|
      @category_grandchildren_array << grandchild
    end
  
    @item.images.build
  end

  def update
    if @item.update(item_params)
      @images = @item.images
      redirect_to item_path(@item)
    else
      flash.now[:alert] = '画像を１枚以上添付してください'
      redirect_to edit_item_path(@item)
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :description, :price, :brand_id, :area, :condition, :fee, :category_id,
      :shipping_days, images_attributes: [:content, :id, :_destroy]
      ).merge(user_id: current_user.id)
  end

  

  def set_item
    @item = Item.find(params[:id])
  end
end